// Offline coverage for OAuth authentication.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `SdkCoreCoverageTest`):
// it exercises the network-free `OAuth` authenticator — applying a bearer
// token to request headers, accepting a client id/secret and requiring
// credentials — to raise core line coverage without network access.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:aspose_barcode_cloud/src/auth/authentication.dart';
import 'package:test/test.dart';

void main() {
  group('OAuth authentication', () {
    test('applies bearer token to headers', () async {
      final oauth = OAuth(
        tokenUrl: 'https://example.test/token',
        accessToken: 'my-token',
      );
      final headers = <String, String>{};
      await oauth.applyToParams([], headers);
      expect(headers['Authorization'], equals('Bearer my-token'));
      expect(oauth, isA<Authentication>());
    });

    test('accepts client id and secret', () {
      final oauth = OAuth(
        tokenUrl: 'https://example.test/token',
        clientId: 'id',
        clientSecret: 'secret',
      );
      expect(oauth.clientId, equals('id'));
      expect(oauth.clientSecret, equals('secret'));
    });

    test('requires credentials', () {
      expect(
        () => OAuth(tokenUrl: 'https://example.test/token'),
        throwsA(isA<ApiException>()),
      );
    });
  });
}
