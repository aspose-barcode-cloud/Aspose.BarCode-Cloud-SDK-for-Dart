// Offline tests for the `ApiClient` lifetime: `close` and `use`.
//
// A loopback HTTP server stands in for both the API and the token endpoint.
// It answers every request and records its path, so a test can tell an open
// client from a closed one and see which requests reached the network.

import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  late HttpServer server;
  final requestPaths = <String>[];

  setUpAll(() async {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) {
      requestPaths.add(request.uri.path);
      final body = request.uri.path == '/connect/token'
          ? '{"access_token":"token","expires_in":3600}'
          : '{"barcodes":[]}';
      request.response
        ..headers.contentType = ContentType.json
        ..write(body)
        ..close();
    });
  });

  tearDownAll(() => server.close(force: true));

  setUp(requestPaths.clear);

  String serverUrl() => 'http://${server.address.host}:${server.port}';

  ApiClient newClient() => ApiClient(Configuration(
        accessToken: 'fake-token',
        basePath: serverUrl(),
      ));

  ApiClient newClientWithCredentials() => ApiClient(Configuration(
        clientId: 'client-id',
        clientSecret: 'client-secret',
        basePath: serverUrl(),
        tokenUrl: '${serverUrl()}/connect/token',
      ));

  Future<BarcodeResponseList> scan(ApiClient client) =>
      ScanApi(client).scan('https://example.com/qr.png');

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

    test('an open client fetches a token before the request', () async {
      final client = newClientWithCredentials();

      await scan(client);

      expect(requestPaths, equals(['/connect/token', '/barcode/scan']));
    });

    test('a closed client sends nothing, not even a token request', () async {
      final client = newClientWithCredentials()..close();

      await expectLater(scan(client), failsAsClosed);
      expect(requestPaths, isEmpty);
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
