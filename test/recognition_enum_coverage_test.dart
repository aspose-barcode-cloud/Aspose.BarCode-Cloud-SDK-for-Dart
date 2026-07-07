// Offline coverage for the barcode recognition enums.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `GeneratedModelCoverageTest`):
// it exercises every value of the recognition configuration enums
// (`RecognitionImageKind`, `RecognitionMode`) — JSON round-trips, `toString`,
// `listFromJson` and invalid-value handling — to raise model line coverage
// without network access.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('barcode recognition enums', () {
    test('RecognitionImageKind covers every value', () {
      final values = <RecognitionImageKind>[
        RecognitionImageKind.Photo,
        RecognitionImageKind.ScannedDocument,
        RecognitionImageKind.ClearImage,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = RecognitionImageKind.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = RecognitionImageKind.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => RecognitionImageKind.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('RecognitionMode covers every value', () {
      final values = <RecognitionMode>[
        RecognitionMode.Fast,
        RecognitionMode.Normal,
        RecognitionMode.Excellent,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = RecognitionMode.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = RecognitionMode.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => RecognitionMode.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
