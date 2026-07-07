// Offline coverage for the generated value-object models.
//
// Mirrors the Python SDK's `test_generated_coverage.py` and the Java SDK's
// `GeneratedModelCoverageTest`: it exercises the generated models
// (JSON round-trips, `toString` and `listFromJson`) to raise model line
// coverage without network access. The generated enums are covered by the
// `*_enum_coverage_test.dart` suites, and the network-free SDK core by
// `api_client_coverage_test.dart`, `configuration_coverage_test.dart`,
// `api_exception_coverage_test.dart`, `authentication_coverage_test.dart`
// and `http_coverage_test.dart`.
//
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';

import 'coverage_fixtures.dart';

void main() {
  group('generated models', () {
    test('RegionPoint round-trips', () {
      final model = regionPoint();
      expect(model.toString(), contains('RegionPoint'));
      final restored = RegionPoint.fromJson(json.decode(json.encode(model)));
      expect(restored.x, equals(10));
      expect(restored.y, equals(20));
      expect(RegionPoint.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('EncodeData round-trips', () {
      final model = encodeData();
      expect(model.toString(), contains('EncodeData'));
      final restored = EncodeData.fromJson(json.decode(json.encode(model)));
      expect(restored.data, equals('encode-me'));
      expect(restored.dataType!.toJson(), equals('StringData'));
      expect(EncodeData.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('BarcodeImageParams round-trips', () {
      final model = barcodeImageParams();
      expect(model.toString(), contains('BarcodeImageParams'));
      final restored =
          BarcodeImageParams.fromJson(json.decode(json.encode(model)));
      expect(restored.imageFormat!.toJson(), equals('Png'));
      expect(restored.textLocation!.toJson(), equals('Below'));
      expect(restored.units!.toJson(), equals('Pixel'));
      expect(restored.foregroundColor, equals('#FF0000'));
      expect(restored.backgroundColor, equals('#00FF00'));
      expect(restored.resolution, equals(96.0));
      expect(restored.imageHeight, equals(200.0));
      expect(restored.imageWidth, equals(300.0));
      expect(restored.rotationAngle, equals(90));
      expect(BarcodeImageParams.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('QrParams round-trips', () {
      final model = qrParams();
      expect(model.toString(), contains('QrParams'));
      final restored = QrParams.fromJson(json.decode(json.encode(model)));
      expect(restored.qrEncodeMode!.toJson(), equals('Auto'));
      expect(restored.qrErrorLevel!.toJson(), equals('LevelL'));
      expect(restored.qrVersion!.toJson(), equals('Auto'));
      expect(restored.qrECIEncoding!.toJson(), equals('UTF8'));
      expect(restored.qrAspectRatio, equals(0.75));
      expect(restored.microQRVersion!.toJson(), equals('M1'));
      expect(restored.rectMicroQrVersion!.toJson(), equals('R7x43'));
      expect(QrParams.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('Code128Params round-trips', () {
      final model = code128Params();
      expect(model.toString(), contains('Code128Params'));
      final restored = Code128Params.fromJson(json.decode(json.encode(model)));
      expect(restored.code128EncodeMode!.toJson(), equals('Auto'));
      expect(Code128Params.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('Pdf417Params round-trips', () {
      final model = pdf417Params();
      expect(model.toString(), contains('Pdf417Params'));
      final restored = Pdf417Params.fromJson(json.decode(json.encode(model)));
      expect(restored.pdf417EncodeMode!.toJson(), equals('Auto'));
      expect(restored.pdf417ErrorLevel!.toJson(), equals('Level0'));
      expect(restored.pdf417Truncate, isTrue);
      expect(restored.pdf417Columns, equals(5));
      expect(restored.pdf417Rows, equals(12));
      expect(restored.pdf417AspectRatio, equals(3.0));
      expect(restored.pdf417ECIEncoding!.toJson(), equals('UTF8'));
      expect(restored.pdf417IsReaderInitialization, isFalse);
      expect(restored.pdf417MacroCharacters!.toJson(), equals('None'));
      expect(restored.pdf417IsLinked, isFalse);
      expect(restored.pdf417IsCode128Emulation, isFalse);
      expect(Pdf417Params.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('GenerateParams round-trips', () {
      final model = generateParams();
      expect(model.toString(), contains('GenerateParams'));
      final restored = GenerateParams.fromJson(json.decode(json.encode(model)));
      expect(restored.barcodeType.toJson(), equals('QR'));
      expect(restored.encodeData.data, equals('encode-me'));
      expect(restored.barcodeImageParams!.imageFormat!.toJson(), equals('Png'));
      expect(restored.qrParams!.qrEncodeMode!.toJson(), equals('Auto'));
      expect(
          restored.code128Params!.code128EncodeMode!.toJson(), equals('Auto'));
      expect(restored.pdf417Params!.pdf417EncodeMode!.toJson(), equals('Auto'));
      expect(GenerateParams.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('BarcodeResponse round-trips', () {
      final model = barcodeResponse();
      expect(model.toString(), contains('BarcodeResponse'));
      final restored =
          BarcodeResponse.fromJson(json.decode(json.encode(model)));
      expect(restored.barcodeValue, equals('value'));
      expect(restored.type, equals('QR'));
      expect(restored.region, hasLength(1));
      expect(restored.region![0].x, equals(10));
      expect(restored.checksum, equals('checksum'));
      expect(BarcodeResponse.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('BarcodeResponseList round-trips', () {
      final model = BarcodeResponseList([barcodeResponse()]);
      expect(model.toString(), contains('BarcodeResponseList'));
      final restored =
          BarcodeResponseList.fromJson(json.decode(json.encode(model)));
      expect(restored.barcodes, hasLength(1));
      expect(restored.barcodes[0].type, equals('QR'));
      expect(
          BarcodeResponseList.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('ApiError round-trips (nested inner error)', () {
      final model = apiError();
      expect(model.toString(), contains('ApiError'));
      final restored = ApiError.fromJson(json.decode(json.encode(model)));
      expect(restored.code, equals('code'));
      expect(restored.message, equals('message'));
      expect(restored.description, equals('description'));
      expect(restored.dateTime, isNotNull);
      expect(restored.innerError, isNotNull);
      expect(restored.innerError!.code, equals('code'));
      expect(ApiError.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));

      // Null dateTime is encoded as an empty string.
      final noDate = ApiError('c', 'm');
      expect(noDate.toJson()['dateTime'], equals(''));
    });

    test('ApiErrorResponse round-trips', () {
      final model = ApiErrorResponse('request-1', apiError());
      expect(model.toString(), contains('ApiErrorResponse'));
      final restored =
          ApiErrorResponse.fromJson(json.decode(json.encode(model)));
      expect(restored.requestId, equals('request-1'));
      expect(restored.error.code, equals('code'));
      expect(ApiErrorResponse.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('RecognizeBase64Request round-trips', () {
      final model = RecognizeBase64Request(
        [DecodeBarcodeType.QR, DecodeBarcodeType.Code128],
        'ZmlsZQ==',
        RecognitionMode.Fast,
        RecognitionImageKind.ClearImage,
      );
      expect(model.toString(), contains('RecognizeBase64Request'));
      final restored =
          RecognizeBase64Request.fromJson(json.decode(json.encode(model)));
      expect(restored.barcodeTypes, hasLength(2));
      expect(restored.fileBase64, equals('ZmlsZQ=='));
      expect(restored.recognitionMode!.toJson(), equals('Fast'));
      expect(restored.recognitionImageKind!.toJson(), equals('ClearImage'));
      expect(
          RecognizeBase64Request.listFromJson(
              [json.decode(json.encode(model))]),
          hasLength(1));
    });

    test('ScanBase64Request round-trips', () {
      final model = ScanBase64Request('ZmlsZQ==');
      expect(model.toString(), contains('ScanBase64Request'));
      final restored =
          ScanBase64Request.fromJson(json.decode(json.encode(model)));
      expect(restored.fileBase64, equals('ZmlsZQ=='));
      expect(ScanBase64Request.listFromJson([json.decode(json.encode(model))]),
          hasLength(1));
    });
  });
}
