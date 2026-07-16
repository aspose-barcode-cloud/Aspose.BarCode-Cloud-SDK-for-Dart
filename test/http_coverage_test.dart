// Offline coverage for the HTTP infrastructure.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `SdkCoreCoverageTest`): it exercises the network-free HTTP helpers in
// `lib/src/http/` — `isPlainAscii`, `boundaryCharacters` and
// `MultipartRequestPlus` — to raise core line coverage.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/src/http/boundary_characters.dart';
import 'package:aspose_barcode_cloud/src/http/multipart_request_plus.dart';
import 'package:aspose_barcode_cloud/src/http/utils.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:test/test.dart';

void main() {
  group('HTTP helpers', () {
    test('isPlainAscii', () {
      expect(isPlainAscii('plain-ascii'), isTrue);
      expect(isPlainAscii('café'), isFalse);
    });

    test('boundaryCharacters table is populated', () {
      expect(boundaryCharacters, isNotEmpty);
    });
  });

  group('MultipartRequestPlus', () {
    test('builds a multipart body from fields and files', () async {
      final request = MultipartRequestPlus(
          'POST', Uri.parse('https://example.test/upload'));
      request.fields['plain'] = ['ascii-value'];
      request.fields['unicode'] = ['café'];
      request.files.add(
          MultipartFile.fromString('file', 'file-content', filename: 'a.txt'));

      expect(request.contentLength, greaterThan(0));

      final body = await request.finalize().bytesToString();
      expect(body, contains('name="plain"'));
      expect(body, contains('name="unicode"'));
      expect(body, contains('filename="a.txt"'));
      expect(request.headers['content-type'], contains('multipart/form-data'));
    });

    test('contentLength cannot be set', () {
      final request = MultipartRequestPlus(
          'POST', Uri.parse('https://example.test/upload'));
      expect(() => request.contentLength = 10, throwsUnsupportedError);
    });
  });
}
