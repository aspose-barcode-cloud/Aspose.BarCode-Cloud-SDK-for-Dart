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
  final fileName =
      "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}Pdf417.png";
  final configuration = makeConfiguration();
  await ApiClient(configuration).use((apiClient) async {
    final generateApi = GenerateApi(apiClient);

    final Uint8List response = await generateApi.generateMultipart(
        EncodeBarcodeType.Pdf417, "Aspose.BarCode.Cloud");

    final file = File(fileName);
    file.writeAsBytes(response);

    print("File '${file.path}' generated.");
  });
}
