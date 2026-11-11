import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

/// Loopback HTTP server that stands in for the API and its token endpoint.
///
/// It answers every request, records what it received, and can hold a
/// response until a test lets it go.
class LoopbackApi {
  LoopbackApi._(this._server) {
    _server.listen(_answer);
  }

  /// Path of the token endpoint.
  static const tokenPath = '/connect/token';

  final HttpServer _server;

  /// URIs of the received requests, in order.
  final uris = <Uri>[];

  /// Runs before each response is written; the response waits for it.
  Future<void> Function(Uri uri)? beforeResponse;

  /// Starts the server on a free loopback port.
  static Future<LoopbackApi> start() async =>
      LoopbackApi._(await HttpServer.bind(InternetAddress.loopbackIPv4, 0));

  /// Base URL of the server.
  String get url => 'http://${_server.address.host}:${_server.port}';

  /// Paths of the received requests, in order.
  List<String> get paths => [for (final uri in uris) uri.path];

  /// Configuration with a ready access token.
  Configuration tokenConfiguration() =>
      Configuration(accessToken: 'fake-token', basePath: url);

  /// Configuration that makes the client fetch a token from this server.
  Configuration credentialsConfiguration() => Configuration(
        clientId: 'client-id',
        clientSecret: 'client-secret',
        basePath: url,
        tokenUrl: '$url$tokenPath',
      );

  /// Waits up to 2 seconds for the server to have no open connections,
  /// then returns how many are still open.
  Future<int> connectionsLeftOpen() async {
    final deadline = DateTime.now().add(const Duration(seconds: 2));
    while (_server.connectionsInfo().total > 0 &&
        DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    return _server.connectionsInfo().total;
  }

  /// Forgets the recorded requests and the response hook.
  void reset() {
    uris.clear();
    beforeResponse = null;
  }

  /// Stops the server and drops its connections.
  Future<void> close() => _server.close(force: true);

  Future<void> _answer(HttpRequest request) async {
    uris.add(request.uri);
    // Read the whole request first, as a real server does.
    await request.drain<void>();
    await beforeResponse?.call(request.uri);
    final body = request.uri.path == tokenPath
        ? '{"access_token":"token","expires_in":3600}'
        : '{"barcodes":[]}';
    request.response
      ..headers.contentType = ContentType.json
      ..write(body);
    await request.response.close();
  }
}
