import 'dart:io';
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Future<void> main() async {
  final configuration = Configuration.fromEnv(prefix: 'TEST_CONFIGURATION_');
  final api = GenerateApi(ApiClient(configuration));
  final batch = BatchGenerateRequest([
    BatchGenerateItem(
        GenerateParams(EncodeBarcodeType.QR, EncodeData('Batch example')),
        'qr.png'),
  ], BatchArchiveFormat.Zip);
  final data = await api.generateBatch(batch);
  await File('barcodes.zip').writeAsBytes(data);
}
