// Offline coverage for the barcode image rendering enums.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `GeneratedModelCoverageTest`):
// it exercises every value of the image rendering enums (`BarcodeImageFormat`,
// `CodeLocation`, `GraphicsUnit`) — JSON round-trips, `toString`,
// `listFromJson` and invalid-value handling — to raise model line coverage
// without network access.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('barcode image enums', () {
    test('BarcodeImageFormat covers every value', () {
      final values = <BarcodeImageFormat>[
        BarcodeImageFormat.Png,
        BarcodeImageFormat.Jpeg,
        BarcodeImageFormat.Svg,
        BarcodeImageFormat.Tiff,
        BarcodeImageFormat.Gif,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = BarcodeImageFormat.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = BarcodeImageFormat.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => BarcodeImageFormat.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('CodeLocation covers every value', () {
      final values = <CodeLocation>[
        CodeLocation.Below,
        CodeLocation.Above,
        CodeLocation.None,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = CodeLocation.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = CodeLocation.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => CodeLocation.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('GraphicsUnit covers every value', () {
      final values = <GraphicsUnit>[
        GraphicsUnit.Pixel,
        GraphicsUnit.Point,
        GraphicsUnit.Inch,
        GraphicsUnit.Millimeter,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = GraphicsUnit.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = GraphicsUnit.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => GraphicsUnit.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
