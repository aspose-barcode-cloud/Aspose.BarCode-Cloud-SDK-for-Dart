// Offline coverage for the Code128 / Pdf417 encode-parameter enums.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `GeneratedModelCoverageTest`):
// it exercises every value of the non-QR encode-parameter enums
// (`Code128EncodeMode`, `Pdf417EncodeMode`, `Pdf417ErrorLevel`,
// `MacroCharacter`, `ECIEncodings`, `EncodeDataType`) — JSON round-trips,
// `toString`, `listFromJson` and invalid-value handling — to raise model line
// coverage without network access.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('encode parameter enums', () {
    test('Code128EncodeMode covers every value', () {
      final values = <Code128EncodeMode>[
        Code128EncodeMode.Auto,
        Code128EncodeMode.CodeA,
        Code128EncodeMode.CodeB,
        Code128EncodeMode.CodeAB,
        Code128EncodeMode.CodeC,
        Code128EncodeMode.CodeAC,
        Code128EncodeMode.CodeBC,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = Code128EncodeMode.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = Code128EncodeMode.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => Code128EncodeMode.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('Pdf417EncodeMode covers every value', () {
      final values = <Pdf417EncodeMode>[
        Pdf417EncodeMode.Auto,
        Pdf417EncodeMode.Binary,
        Pdf417EncodeMode.ECI,
        Pdf417EncodeMode.Extended,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = Pdf417EncodeMode.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = Pdf417EncodeMode.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => Pdf417EncodeMode.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('Pdf417ErrorLevel covers every value', () {
      final values = <Pdf417ErrorLevel>[
        Pdf417ErrorLevel.Level0,
        Pdf417ErrorLevel.Level1,
        Pdf417ErrorLevel.Level2,
        Pdf417ErrorLevel.Level3,
        Pdf417ErrorLevel.Level4,
        Pdf417ErrorLevel.Level5,
        Pdf417ErrorLevel.Level6,
        Pdf417ErrorLevel.Level7,
        Pdf417ErrorLevel.Level8,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = Pdf417ErrorLevel.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = Pdf417ErrorLevel.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => Pdf417ErrorLevel.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('MacroCharacter covers every value', () {
      final values = <MacroCharacter>[
        MacroCharacter.None,
        MacroCharacter.Macro05,
        MacroCharacter.Macro06,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = MacroCharacter.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = MacroCharacter.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => MacroCharacter.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('ECIEncodings covers every value', () {
      final values = <ECIEncodings>[
        ECIEncodings.NONE,
        ECIEncodings.ISO_8859_1,
        ECIEncodings.ISO_8859_2,
        ECIEncodings.ISO_8859_3,
        ECIEncodings.ISO_8859_4,
        ECIEncodings.ISO_8859_5,
        ECIEncodings.ISO_8859_6,
        ECIEncodings.ISO_8859_7,
        ECIEncodings.ISO_8859_8,
        ECIEncodings.ISO_8859_9,
        ECIEncodings.ISO_8859_10,
        ECIEncodings.ISO_8859_11,
        ECIEncodings.ISO_8859_13,
        ECIEncodings.ISO_8859_14,
        ECIEncodings.ISO_8859_15,
        ECIEncodings.ISO_8859_16,
        ECIEncodings.Shift_JIS,
        ECIEncodings.Win1250,
        ECIEncodings.Win1251,
        ECIEncodings.Win1252,
        ECIEncodings.Win1256,
        ECIEncodings.UTF16BE,
        ECIEncodings.UTF8,
        ECIEncodings.US_ASCII,
        ECIEncodings.Big5,
        ECIEncodings.GB2312,
        ECIEncodings.EUC_KR,
        ECIEncodings.GBK,
        ECIEncodings.GB18030,
        ECIEncodings.UTF16LE,
        ECIEncodings.UTF32BE,
        ECIEncodings.UTF32LE,
        ECIEncodings.INVARIANT,
        ECIEncodings.BINARY,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = ECIEncodings.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = ECIEncodings.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => ECIEncodings.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('EncodeDataType covers every value', () {
      final values = <EncodeDataType>[
        EncodeDataType.StringData,
        EncodeDataType.Base64Bytes,
        EncodeDataType.HexBytes,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = EncodeDataType.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = EncodeDataType.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => EncodeDataType.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
