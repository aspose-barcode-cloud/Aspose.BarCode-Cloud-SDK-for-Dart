import 'package:test/test.dart';
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'test_config.dart';

void main() {
  group('barcodeGenerateApiTests', () {
    test('should generate image with generate', () async {
      final generated = await TestConfig.generateApi.generate(
          EncodeBarcodeType.QR, 'Testing generator',
          barcodeImageParams: BarcodeImageParams()
            ..foregroundColor = '#001100');

      final imageSize = generated.length;
      expect(imageSize, greaterThan(0), reason: 'ImageSize=$imageSize');
    });

    test('should generate image with generateBody', () async {
      final imageParams = BarcodeImageParams();
      imageParams.backgroundColor = '#ffddff';

      final encodeData = EncodeData("Testing generator");

      final generateParams =
          GenerateParams(EncodeBarcodeType.Pdf417, encodeData, imageParams);

      final generated =
          await TestConfig.generateApi.generateBody(generateParams);

      final imageSize = generated.length;
      expect(imageSize, greaterThan(0), reason: 'ImageSize=$imageSize');
    });

    test('should generate image with generateMultipart', () async {
      final generated = await TestConfig.generateApi.generateMultipart(
          EncodeBarcodeType.QR, 'Testing generator',
          dataType: EncodeDataType.StringData,
          barcodeImageParams: BarcodeImageParams()..rotationAngle = 90);

      final imageSize = generated.lengthInBytes;
      expect(imageSize, greaterThan(0), reason: 'ImageSize=$imageSize');
    });
  });
}
