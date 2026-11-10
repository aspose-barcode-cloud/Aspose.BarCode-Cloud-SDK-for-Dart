import 'dart:io';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Configuration makeConfiguration() {
  final jwtToken = Platform.environment['TEST_CONFIGURATION_ACCESS_TOKEN'];
  if (jwtToken != null) {
    return Configuration(accessToken: jwtToken);
  } else {
    return Configuration(
      clientId: "Client Id from https://dashboard.aspose.cloud/applications",
      clientSecret:
          "Client Secret from https://dashboard.aspose.cloud/applications",
    );
  }
}

Future<void> main() async {
  final config = makeConfiguration();
  await ApiClient(config).use((apiClient) async {
    final recognizeApi = RecognizeApi(apiClient);

    final result = await recognizeApi.recognize(
      DecodeBarcodeType.QR,
      "https://products.aspose.app/barcode/scan/img/how-to/scan/step2.png",
    );

    if (result.barcodes.isNotEmpty) {
      print("File recognized, result: '${result.barcodes[0].barcodeValue}'");
    } else {
      print("No barcodes were recognized.");
    }
  });
}
