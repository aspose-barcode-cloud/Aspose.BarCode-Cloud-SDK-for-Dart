// Offline coverage for the barcode symbology type enums.
//
// Split out of `generated_model_coverage_test.dart` (which mirrors the
// Python SDK's `test_generated_coverage.py` and the Java SDK's
// `GeneratedModelCoverageTest`):
// it exercises every value of the barcode symbology catalog enums
// (`DecodeBarcodeType`, `EncodeBarcodeType`) — JSON round-trips, `toString`,
// `listFromJson` and invalid-value handling — to raise model line coverage
// without network access.
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

void main() {
  group('barcode type enums', () {
    test('DecodeBarcodeType covers every value', () {
      final values = <DecodeBarcodeType>[
        DecodeBarcodeType.MostCommonlyUsed,
        DecodeBarcodeType.QR,
        DecodeBarcodeType.AustraliaPost,
        DecodeBarcodeType.AustralianPosteParcel,
        DecodeBarcodeType.Aztec,
        DecodeBarcodeType.Codabar,
        DecodeBarcodeType.CodablockF,
        DecodeBarcodeType.Code11,
        DecodeBarcodeType.Code128,
        DecodeBarcodeType.Code16K,
        DecodeBarcodeType.Code32,
        DecodeBarcodeType.Code39,
        DecodeBarcodeType.Code39FullASCII,
        DecodeBarcodeType.Code93,
        DecodeBarcodeType.CompactPdf417,
        DecodeBarcodeType.DataLogic2of5,
        DecodeBarcodeType.DataMatrix,
        DecodeBarcodeType.DatabarExpanded,
        DecodeBarcodeType.DatabarExpandedStacked,
        DecodeBarcodeType.DatabarLimited,
        DecodeBarcodeType.DatabarOmniDirectional,
        DecodeBarcodeType.DatabarStacked,
        DecodeBarcodeType.DatabarStackedOmniDirectional,
        DecodeBarcodeType.DatabarTruncated,
        DecodeBarcodeType.DeutschePostIdentcode,
        DecodeBarcodeType.DeutschePostLeitcode,
        DecodeBarcodeType.DotCode,
        DecodeBarcodeType.DutchKIX,
        DecodeBarcodeType.EAN13,
        DecodeBarcodeType.EAN14,
        DecodeBarcodeType.EAN8,
        DecodeBarcodeType.GS1Aztec,
        DecodeBarcodeType.GS1Code128,
        DecodeBarcodeType.GS1CompositeBar,
        DecodeBarcodeType.GS1DataMatrix,
        DecodeBarcodeType.GS1DotCode,
        DecodeBarcodeType.GS1HanXin,
        DecodeBarcodeType.GS1MicroPdf417,
        DecodeBarcodeType.GS1QR,
        DecodeBarcodeType.HanXin,
        DecodeBarcodeType.HIBCAztecLIC,
        DecodeBarcodeType.HIBCAztecPAS,
        DecodeBarcodeType.HIBCCode128LIC,
        DecodeBarcodeType.HIBCCode128PAS,
        DecodeBarcodeType.HIBCCode39LIC,
        DecodeBarcodeType.HIBCCode39PAS,
        DecodeBarcodeType.HIBCDataMatrixLIC,
        DecodeBarcodeType.HIBCDataMatrixPAS,
        DecodeBarcodeType.HIBCQRLIC,
        DecodeBarcodeType.HIBCQRPAS,
        DecodeBarcodeType.IATA2of5,
        DecodeBarcodeType.ISBN,
        DecodeBarcodeType.ISMN,
        DecodeBarcodeType.ISSN,
        DecodeBarcodeType.ITF14,
        DecodeBarcodeType.ITF6,
        DecodeBarcodeType.Interleaved2of5,
        DecodeBarcodeType.ItalianPost25,
        DecodeBarcodeType.MacroPdf417,
        DecodeBarcodeType.Mailmark,
        DecodeBarcodeType.Matrix2of5,
        DecodeBarcodeType.MaxiCode,
        DecodeBarcodeType.MicrE13B,
        DecodeBarcodeType.MicroPdf417,
        DecodeBarcodeType.MicroQR,
        DecodeBarcodeType.MSI,
        DecodeBarcodeType.OneCode,
        DecodeBarcodeType.OPC,
        DecodeBarcodeType.PatchCode,
        DecodeBarcodeType.Pdf417,
        DecodeBarcodeType.Pharmacode,
        DecodeBarcodeType.Planet,
        DecodeBarcodeType.Postnet,
        DecodeBarcodeType.PZN,
        DecodeBarcodeType.RectMicroQR,
        DecodeBarcodeType.RM4SCC,
        DecodeBarcodeType.SCC14,
        DecodeBarcodeType.SSCC18,
        DecodeBarcodeType.Standard2of5,
        DecodeBarcodeType.Supplement,
        DecodeBarcodeType.SwissPostParcel,
        DecodeBarcodeType.UPCA,
        DecodeBarcodeType.UPCE,
        DecodeBarcodeType.VIN,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = DecodeBarcodeType.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = DecodeBarcodeType.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => DecodeBarcodeType.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });

    test('EncodeBarcodeType covers every value', () {
      final values = <EncodeBarcodeType>[
        EncodeBarcodeType.QR,
        EncodeBarcodeType.AustraliaPost,
        EncodeBarcodeType.AustralianPosteParcel,
        EncodeBarcodeType.Aztec,
        EncodeBarcodeType.Codabar,
        EncodeBarcodeType.CodablockF,
        EncodeBarcodeType.Code11,
        EncodeBarcodeType.Code128,
        EncodeBarcodeType.Code16K,
        EncodeBarcodeType.Code32,
        EncodeBarcodeType.Code39,
        EncodeBarcodeType.Code39FullASCII,
        EncodeBarcodeType.Code93,
        EncodeBarcodeType.DataLogic2of5,
        EncodeBarcodeType.DataMatrix,
        EncodeBarcodeType.DatabarExpanded,
        EncodeBarcodeType.DatabarExpandedStacked,
        EncodeBarcodeType.DatabarLimited,
        EncodeBarcodeType.DatabarOmniDirectional,
        EncodeBarcodeType.DatabarStacked,
        EncodeBarcodeType.DatabarStackedOmniDirectional,
        EncodeBarcodeType.DatabarTruncated,
        EncodeBarcodeType.DeutschePostIdentcode,
        EncodeBarcodeType.DeutschePostLeitcode,
        EncodeBarcodeType.DotCode,
        EncodeBarcodeType.DutchKIX,
        EncodeBarcodeType.EAN13,
        EncodeBarcodeType.EAN14,
        EncodeBarcodeType.EAN8,
        EncodeBarcodeType.GS1Aztec,
        EncodeBarcodeType.GS1CodablockF,
        EncodeBarcodeType.GS1Code128,
        EncodeBarcodeType.GS1DataMatrix,
        EncodeBarcodeType.GS1DotCode,
        EncodeBarcodeType.GS1HanXin,
        EncodeBarcodeType.GS1MicroPdf417,
        EncodeBarcodeType.GS1QR,
        EncodeBarcodeType.HanXin,
        EncodeBarcodeType.IATA2of5,
        EncodeBarcodeType.ISBN,
        EncodeBarcodeType.ISMN,
        EncodeBarcodeType.ISSN,
        EncodeBarcodeType.ITF14,
        EncodeBarcodeType.ITF6,
        EncodeBarcodeType.Interleaved2of5,
        EncodeBarcodeType.ItalianPost25,
        EncodeBarcodeType.MSI,
        EncodeBarcodeType.MacroPdf417,
        EncodeBarcodeType.Mailmark,
        EncodeBarcodeType.Matrix2of5,
        EncodeBarcodeType.MaxiCode,
        EncodeBarcodeType.MicroPdf417,
        EncodeBarcodeType.MicroQR,
        EncodeBarcodeType.OPC,
        EncodeBarcodeType.OneCode,
        EncodeBarcodeType.PZN,
        EncodeBarcodeType.PatchCode,
        EncodeBarcodeType.Pdf417,
        EncodeBarcodeType.Pharmacode,
        EncodeBarcodeType.Planet,
        EncodeBarcodeType.Postnet,
        EncodeBarcodeType.RM4SCC,
        EncodeBarcodeType.RectMicroQR,
        EncodeBarcodeType.SCC14,
        EncodeBarcodeType.SSCC18,
        EncodeBarcodeType.SingaporePost,
        EncodeBarcodeType.Standard2of5,
        EncodeBarcodeType.SwissPostParcel,
        EncodeBarcodeType.UPCA,
        EncodeBarcodeType.UPCE,
        EncodeBarcodeType.UpcaGs1Code128Coupon,
        EncodeBarcodeType.UpcaGs1DatabarCoupon,
        EncodeBarcodeType.VIN,
      ];
      for (final value in values) {
        final encoded = value.toJson();
        expect(encoded, isNotNull);
        expect(value.toString(), equals(encoded));
        final decoded = EncodeBarcodeType.fromJson(encoded);
        expect(decoded.toJson(), equals(encoded));
      }
      final wire = values.map((v) => v.toJson()).toList();
      final roundTripped = EncodeBarcodeType.listFromJson(wire);
      expect(roundTripped, hasLength(values.length));
      expect(
        () => EncodeBarcodeType.fromJson('__not_a_valid_enum_value__'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
