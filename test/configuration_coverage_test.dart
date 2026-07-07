// Offline coverage for the SDK `Configuration`.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `SdkCoreCoverageTest`):
// it exercises the network-free `Configuration` infrastructure — defaults,
// explicit values, `save`/`load` round-trips and `fromEnv` — to raise core
// line coverage without network access. (The live example-config round-trip
// lives in `configuration_test.dart`.)
//
// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('Configuration', () {
    test('defaults and explicit values', () {
      final defaults = Configuration(accessToken: 'token');
      expect(defaults.basePath, equals('https://api.aspose.cloud/v4.0'));
      expect(
          defaults.tokenUrl, equals('https://id.aspose.cloud/connect/token'));

      final explicit = Configuration(
        clientId: 'id',
        clientSecret: 'secret',
        basePath: 'https://example.test/base',
        tokenUrl: 'https://example.test/token',
        accessToken: 'token',
      );
      expect(explicit.clientId, equals('id'));
      expect(explicit.clientSecret, equals('secret'));
      expect(explicit.basePath, equals('https://example.test/base'));
      expect(explicit.tokenUrl, equals('https://example.test/token'));
      expect(explicit.accessToken, equals('token'));
    });

    test('save and load round-trip', () async {
      final dir = Directory.systemTemp.createTempSync('aspose-dart-cover');
      final path = '${dir.path}${Platform.pathSeparator}config.json';
      final config = Configuration(
        clientId: 'id',
        clientSecret: 'secret',
        accessToken: 'token',
      );
      await config.save(path);

      final loaded = Configuration.load(path);
      expect(loaded, isNotNull);
      expect(loaded!.clientId, equals('id'));
      expect(loaded.clientSecret, equals('secret'));
      expect(loaded.accessToken, equals('token'));

      expect(
          Configuration.load(
              '${dir.path}${Platform.pathSeparator}missing.json'),
          isNull);
      dir.deleteSync(recursive: true);
    });

    test('fromEnv reads the access token', () {
      final config = Configuration.fromEnv(prefix: 'DEFINITELY_MISSING_');
      expect(config.accessToken, isNull);
    });
  });
}
