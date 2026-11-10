// Offline tests for the `ApiClient` lifetime: `close` and `use`.
//
// A loopback HTTP server stands in for the API and answers every request,
// so only a closed client fails with a `ClientException`.

import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:http/http.dart' show ClientException;
import 'package:test/test.dart';

void main() {
  late HttpServer server;

  setUpAll(() async {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) {
      request.response
        ..headers.contentType = ContentType.json
        ..write('{"barcodes":[]}')
        ..close();
    });
  });

  tearDownAll(() => server.close(force: true));

  ApiClient newClient() => ApiClient(Configuration(
        accessToken: 'fake-token',
        basePath: 'http://${server.address.host}:${server.port}',
      ));

  Future<BarcodeResponseList> scan(ApiClient client) =>
      ScanApi(client).scan('https://example.com/qr.png');

  final failsAsClosed = throwsA(isA<ClientException>());

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
