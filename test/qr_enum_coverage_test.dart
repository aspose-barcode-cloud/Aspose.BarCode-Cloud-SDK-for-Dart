// Offline coverage for the QR-family enums.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `GeneratedModelCoverageTest`):
// it exercises every value of the QR / Micro QR / Rectangular Micro QR
// parameter enums (`QREncodeMode`, `QRErrorLevel`, `QRVersion`,
// `MicroQRVersion`, `RectMicroQRVersion`) — JSON round-trips, `toString`,
// `listFromJson` and invalid-value handling — to raise model line coverage
// without network access.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('QR enums', () {
    test('QREncodeMode covers every value', () {
      final values = <QREncodeMode>[
        QREncodeMode.Auto,
        QREncodeMode.Extended,
        QREncodeMode.Binary,
        QREncodeMode.ECI,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = QREncodeMode.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = QREncodeMode.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => QREncodeMode.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('QRErrorLevel covers every value', () {
      final values = <QRErrorLevel>[
        QRErrorLevel.LevelL,
        QRErrorLevel.LevelM,
        QRErrorLevel.LevelQ,
        QRErrorLevel.LevelH,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = QRErrorLevel.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = QRErrorLevel.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => QRErrorLevel.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('QRVersion covers every value', () {
      final values = <QRVersion>[
        QRVersion.Auto,
        QRVersion.Version01,
        QRVersion.Version02,
        QRVersion.Version03,
        QRVersion.Version04,
        QRVersion.Version05,
        QRVersion.Version06,
        QRVersion.Version07,
        QRVersion.Version08,
        QRVersion.Version09,
        QRVersion.Version10,
        QRVersion.Version11,
        QRVersion.Version12,
        QRVersion.Version13,
        QRVersion.Version14,
        QRVersion.Version15,
        QRVersion.Version16,
        QRVersion.Version17,
        QRVersion.Version18,
        QRVersion.Version19,
        QRVersion.Version20,
        QRVersion.Version21,
        QRVersion.Version22,
        QRVersion.Version23,
        QRVersion.Version24,
        QRVersion.Version25,
        QRVersion.Version26,
        QRVersion.Version27,
        QRVersion.Version28,
        QRVersion.Version29,
        QRVersion.Version30,
        QRVersion.Version31,
        QRVersion.Version32,
        QRVersion.Version33,
        QRVersion.Version34,
        QRVersion.Version35,
        QRVersion.Version36,
        QRVersion.Version37,
        QRVersion.Version38,
        QRVersion.Version39,
        QRVersion.Version40,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = QRVersion.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = QRVersion.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => QRVersion.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('MicroQRVersion covers every value', () {
      final values = <MicroQRVersion>[
        MicroQRVersion.Auto,
        MicroQRVersion.M1,
        MicroQRVersion.M2,
        MicroQRVersion.M3,
        MicroQRVersion.M4,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = MicroQRVersion.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = MicroQRVersion.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => MicroQRVersion.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('RectMicroQRVersion covers every value', () {
      final values = <RectMicroQRVersion>[
        RectMicroQRVersion.Auto,
        RectMicroQRVersion.R7x43,
        RectMicroQRVersion.R7x59,
        RectMicroQRVersion.R7x77,
        RectMicroQRVersion.R7x99,
        RectMicroQRVersion.R7x139,
        RectMicroQRVersion.R9x43,
        RectMicroQRVersion.R9x59,
        RectMicroQRVersion.R9x77,
        RectMicroQRVersion.R9x99,
        RectMicroQRVersion.R9x139,
        RectMicroQRVersion.R11x27,
        RectMicroQRVersion.R11x43,
        RectMicroQRVersion.R11x59,
        RectMicroQRVersion.R11x77,
        RectMicroQRVersion.R11x99,
        RectMicroQRVersion.R11x139,
        RectMicroQRVersion.R13x27,
        RectMicroQRVersion.R13x43,
        RectMicroQRVersion.R13x59,
        RectMicroQRVersion.R13x77,
        RectMicroQRVersion.R13x99,
        RectMicroQRVersion.R13x139,
        RectMicroQRVersion.R15x43,
        RectMicroQRVersion.R15x59,
        RectMicroQRVersion.R15x77,
        RectMicroQRVersion.R15x99,
        RectMicroQRVersion.R15x139,
        RectMicroQRVersion.R17x43,
        RectMicroQRVersion.R17x59,
        RectMicroQRVersion.R17x77,
        RectMicroQRVersion.R17x99,
        RectMicroQRVersion.R17x139,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = RectMicroQRVersion.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = RectMicroQRVersion.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => RectMicroQRVersion.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
