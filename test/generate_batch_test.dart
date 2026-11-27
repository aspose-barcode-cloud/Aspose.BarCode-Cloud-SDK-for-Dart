import 'package:test/test.dart';
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
import 'test_config.dart';

void main() {
  for (final format in [
    BatchArchiveFormat.Zip,
    BatchArchiveFormat.Tar,
    BatchArchiveFormat.TarGzip
  ]) {
    test('generateBatch returns a binary $format archive', () async {
      final generation =
          GenerateParams(EncodeBarcodeType.QR, EncodeData('Batch example'));
      final batch = BatchGenerateRequest(
          [BatchGenerateItem(generation, 'qr.png')], format);
      final data = await TestConfig.generateApi.generateBatch(batch);
      expect(data, isNotEmpty);
      if (format == BatchArchiveFormat.Zip) {
        expect(data.take(4).toList(), [0x50, 0x4b, 0x03, 0x04]);
      } else if (format == BatchArchiveFormat.TarGzip) {
        expect(data.take(2).toList(), [0x1f, 0x8b]);
      } else {
        expect(String.fromCharCodes(data.sublist(257, 262)), 'ustar');
      }
    });
  }
}
