// Offline coverage for `ApiException`.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `SdkCoreCoverageTest`):
// it exercises the network-free `ApiException` behaviour — `toString`,
// `getDetails`, `withInner` and `withResponse` (details built from an
// `ApiError`, with and without a description) — to raise core line coverage.
// (The live 400-response parsing path lives in `exception_test.dart`.)
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('ApiException', () {
    test('plain exception toString', () {
      final ex = ApiException(404, 'Not Found');
      expect(ex.code, equals(404));
      expect(ex.message, equals('Not Found'));
      expect(ex.toString(), equals('ApiException 404: Not Found'));
      expect(ex.getDetails(), equals(''));
    });

    test('withInner exposes inner exception', () {
      final inner = FormatException('boom');
      final ex =
          ApiException.withInner(0, 'wrapped', inner, StackTrace.current);
      expect(ex.innerException, equals(inner));
      expect(ex.toString(), contains('Inner exception'));
    });

    test('withResponse builds details from ApiError', () {
      final withDescription = ApiException.withResponse(
        400,
        'Bad Request',
        ApiErrorResponse(
          'request-1',
          ApiError('errCode', 'errMessage', 'errDescription'),
        ),
      );
      expect(withDescription.getDetails(),
          equals('errCode: errMessageerrDescription'));

      final withoutDescription = ApiException.withResponse(
        400,
        'Bad Request',
        ApiErrorResponse('request-2', ApiError('errCode', 'errMessage')),
      );
      expect(withoutDescription.getDetails(), equals('errCode: errMessage'));
    });
  });
}
