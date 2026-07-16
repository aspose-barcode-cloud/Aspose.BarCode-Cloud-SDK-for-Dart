// Shared fixture builders for the offline coverage suites
// (`generated_model_coverage_test.dart` and `api_client_coverage_test.dart`).
//
// ignore_for_file: non_constant_identifier_names

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

BarcodeImageParams barcodeImageParams() => BarcodeImageParams(
      BarcodeImageFormat.Png,
      CodeLocation.Below,
      '#FF0000',
      '#00FF00',
      GraphicsUnit.Pixel,
      96.0,
      200.0,
      300.0,
      90,
    );

QrParams qrParams() => QrParams(
      QREncodeMode.Auto,
      QRErrorLevel.LevelL,
      QRVersion.Auto,
      ECIEncodings.UTF8,
      0.75,
      MicroQRVersion.M1,
      RectMicroQRVersion.R7x43,
    );

Code128Params code128Params() => Code128Params(Code128EncodeMode.Auto);

Pdf417Params pdf417Params() => Pdf417Params(
      Pdf417EncodeMode.Auto,
      Pdf417ErrorLevel.Level0,
      true,
      5,
      12,
      3.0,
      ECIEncodings.UTF8,
      false,
      MacroCharacter.None,
      false,
      false,
    );

EncodeData encodeData() => EncodeData('encode-me', EncodeDataType.StringData);

RegionPoint regionPoint() => RegionPoint(10, 20);

BarcodeResponse barcodeResponse() => BarcodeResponse(
      'value',
      'QR',
      [regionPoint()],
      'checksum',
    );

ApiError apiError({bool withInner = true}) => ApiError(
      'code',
      'message',
      'description',
      DateTime.utc(2026, 6, 29, 1, 2, 3),
      withInner ? apiError(withInner: false) : null,
    );

GenerateParams generateParams() => GenerateParams(
      EncodeBarcodeType.QR,
      encodeData(),
      barcodeImageParams(),
      qrParams(),
      code128Params(),
      pdf417Params(),
    );
