// Offline tests for the `ApiClient` lifetime: `close` and `use`.
//
// A loopback server stands in for both the API and the token endpoint, so a
// test can tell an open client from a closed one and see which requests
// reached the network.

import 'dart:async';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

import 'loopback_api.dart';

void main() {
  late LoopbackApi api;

  setUpAll(() async => api = await LoopbackApi.start());
  tearDownAll(() => api.close());
  setUp(() => api.reset());

  ApiClient newClient() => ApiClient(api.tokenConfiguration());

  ApiClient newClientWithCredentials() =>
      ApiClient(api.credentialsConfiguration());

  Future<BarcodeResponseList> scan(ApiClient client) =>
      ScanApi(client).scan('https://example.com/qr.png');

  /// Holds the response to the first request for [path] until the returned
  /// completer completes; [received] completes when that request arrives.
  Completer<void> holdResponse(String path, Completer<void> received) {
    final release = Completer<void>();
    api.beforeResponse = (uri) async {
      if (uri.path == path && !received.isCompleted) {
        received.complete();
        await release.future;
      }
    };
    return release;
  }

  final failsAsClosed = throwsA(isA<ApiException>()
      .having((e) => e.message, 'message', 'ApiClient is closed'));

  group('ApiClient lifetime', () {
    test('requests fail after close', () async {
      final client = newClient();
      expect((await scan(client)).barcodes, isEmpty);

      client.close();

      await expectLater(scan(client), failsAsClosed);
    });

    test('close twice does nothing', () async {
      final client = newClient()..close();
      client.close();

      await expectLater(scan(client), failsAsClosed);
    });

    test('close releases the keep-alive connection', () async {
      expect(await api.connectionsLeftOpen(), isZero,
          reason: 'an earlier test left a connection open');
      final client = newClient();
      await scan(client);
      expect(await api.connectionsLeftOpen(), equals(1));

      client.close();

      expect(await api.connectionsLeftOpen(), isZero);
    });

    test('an open client fetches a token before the request', () async {
      await newClientWithCredentials().use(scan);

      expect(api.paths, equals([LoopbackApi.tokenPath, '/barcode/scan']));
    });

    test('a closed client sends nothing, not even a token request', () async {
      final client = newClientWithCredentials()..close();

      await expectLater(scan(client), failsAsClosed);
      expect(api.paths, isEmpty);
    });

    test('close aborts a pending token request', () async {
      final tokenRequested = Completer<void>();
      final release = holdResponse(LoopbackApi.tokenPath, tokenRequested);
      final client = newClientWithCredentials();
      // The token response is held until after the check, so the call ends
      // in time only if close() aborts the token request itself.
      final outcome = expectLater(
          scan(client).timeout(const Duration(seconds: 2)), failsAsClosed);

      await tokenRequested.future;
      client.close();

      await outcome;
      release.complete();
      expect(api.paths, equals([LoopbackApi.tokenPath]));
    });

    test('close aborts a request in flight with ApiException', () async {
      final scanRequested = Completer<void>();
      final release = holdResponse('/barcode/scan', scanRequested);
      final client = newClient();
      final outcome = expectLater(scan(client), failsAsClosed);

      await scanRequested.future;
      client.close();
      release.complete();

      await outcome;
    });

    test('use returns the action result and then closes the client', () async {
      final client = newClient();

      final barcodeCount = await client.use((usedClient) async {
        expect(usedClient, same(client));
        return (await scan(usedClient)).barcodes.length;
      });

      expect(barcodeCount, equals(0));
      await expectLater(scan(client), failsAsClosed);
    });

    test('use accepts a synchronous action', () async {
      final client = newClient();

      expect(await client.use((_) => 'done'), equals('done'));
      await expectLater(scan(client), failsAsClosed);
    });

    test('use closes the client when the action throws', () async {
      final client = newClient();

      await expectLater(
        client.use<void>((_) async => throw StateError('boom')),
        throwsA(isA<StateError>()),
      );
      await expectLater(scan(client), failsAsClosed);
    });
  });
}
