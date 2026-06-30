import 'dart:io';
import 'dart:typed_data';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Configuration makeConfiguration() {
  final envToken = Platform.environment['TEST_CONFIGURATION_ACCESS_TOKEN'];
  if (envToken != null) {
    return Configuration(accessToken: envToken);
  } else {
    return Configuration(
      clientId: "Client Id from https://dashboard.aspose.cloud/applications",
      clientSecret:
          "Client Secret from https://dashboard.aspose.cloud/applications",
    );
  }
}

Future<void> main() async {
  final configuration = makeConfiguration();
  final apiClient = ApiClient(configuration);
  final generateApi = GenerateApi(apiClient);

  final fileName =
      '${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}qr.png';

  final Uint8List response = await generateApi.generate(
    EncodeBarcodeType.QR,
    "Aspose.BarCode.Cloud",
    barcodeImageParams: BarcodeImageParams()
      ..imageHeight = 200
      ..imageWidth = 200
      ..resolution = 300
      ..units = GraphicsUnit.Pixel,
  );

  final file = File(fileName);
  file.writeAsBytes(response);

  print("File '${file.path}' generated.");
}
