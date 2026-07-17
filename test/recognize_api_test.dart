import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

import 'test_config.dart';

void main() {
  final fileToRecognize = "test_data${Platform.pathSeparator}qr.png";

  test('.recognizeMultipart', () async {
    final barcode = await File(fileToRecognize).readAsBytes();
    final BarcodeResponseList recognized = await TestConfig.recognizeApi
        .recognizeMultipart(DecodeBarcodeType.QR, barcode,
            recognitionMode: RecognitionMode.Fast,
            recognitionImageKind: RecognitionImageKind.ClearImage);

    expect(recognized, isNotNull);
    expect(recognized.barcodes, isNotEmpty);
    expect(recognized.barcodes[0].type, equals('QR'));
    expect(recognized.barcodes[0].barcodeValue, equals('Aspose.BarCode.Cloud'));
  });

  test("Barcode Recognize Barcode Type Get", () async {
    // Test case for barcode_recognize_barcode_type_get
    var response = await TestConfig.recognizeApi.recognize(
      DecodeBarcodeType.QR,
      'https://raw.githubusercontent.com/aspose-barcode-cloud/Aspose.BarCode-Cloud-SDK-for-Dart/main/test_data/qr_and_code128.png',
      recognitionMode: RecognitionMode.Fast,
      recognitionImageKind: RecognitionImageKind.ClearImage,
    );

    expect(response.barcodes.length, equals(1));
    var barcode = response.barcodes[0];
    expect(barcode.type, equals('QR'));
    expect(barcode.barcodeValue, equals('QR text'));
  });

  test("Barcode Recognize Body Post", () async {
    // Test case for barcode_recognize_body_post
    var imageBytes = await File(fileToRecognize).readAsBytes();
    var encodedString = base64Encode(imageBytes);
    var response = await TestConfig.recognizeApi.recognizeBase64(
      RecognizeBase64Request(
        [DecodeBarcodeType.QR],
        encodedString,
      ),
    );
    expect(response.barcodes, isNotNull);
    expect(response.barcodes.length, equals(1));
    var barcode = response.barcodes[0];
    expect(barcode.type, equals('QR'));
    expect(barcode.barcodeValue, equals('Aspose.BarCode.Cloud'));
    expect(barcode.region![0].x, greaterThan(0));
    expect(barcode.region![0].y, greaterThan(0));
  });
}
