import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

import 'test_config.dart';

void main() {
  final fileToRecognize =
      "test_data${Platform.pathSeparator}qr_and_code128.png";

  test(
    '.scanBarcodes can scan 2 type',
    () async {
      final barcode = await File(fileToRecognize).readAsBytes();
      final BarcodeResponseList recognized =
          await TestConfig.scanApi.scanMultipart(barcode);

      expect(recognized, isNotNull);
      expect(recognized.barcodes, isNotEmpty);
      expect(recognized.barcodes.length, equals(2));

      expect(recognized.barcodes[0].type, equals('QR'));
      expect(recognized.barcodes[0].barcodeValue, equals('QR text'));

      expect(recognized.barcodes[1].type, equals('Code128'));
      expect(recognized.barcodes[1].barcodeValue, equals('Code128 text'));
    },
  );

  test("Barcode Scan Get", () async {
    // Test case for barcode_scan_get
    var response = await TestConfig.scanApi.scan(
        'https://raw.githubusercontent.com/aspose-barcode-cloud/Aspose.BarCode-Cloud-SDK-for-Dart/main/test_data/qr_and_code128.png');

    expect(response.barcodes.length, equals(2));
    expect(response.barcodes[0].type, equals('QR'));
    expect(response.barcodes[0].barcodeValue, equals('QR text'));
    expect(response.barcodes[1].type, equals('Code128'));
    expect(response.barcodes[1].barcodeValue, equals('Code128 text'));
  });

  test("Barcode Scan Body Post", () async {
    // Test case for barcode_scan_body_post
    var imageBytes = await File(fileToRecognize).readAsBytes();
    var encodedString = base64Encode(imageBytes);

    var response =
        await TestConfig.scanApi.scanBase64(ScanBase64Request(encodedString));

    expect(response.barcodes, isNotNull);
    expect(response.barcodes.length, equals(2));

    expect(response.barcodes[0].type, equals('QR'));
    expect(response.barcodes[0].barcodeValue, equals('QR text'));

    expect(response.barcodes[1].type, equals('Code128'));
    expect(response.barcodes[1].barcodeValue, equals('Code128 text'));
  });
}
