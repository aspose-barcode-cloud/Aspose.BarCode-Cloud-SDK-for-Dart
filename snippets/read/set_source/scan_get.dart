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
    final scanApi = ScanApi(apiClient);

    final barcodeImageUrl =
        "https://products.aspose.app/barcode/scan/img/how-to/scan/step2.png";

    final BarcodeResponseList result = await scanApi.scan(barcodeImageUrl);

    if (result.barcodes.isNotEmpty) {
      final barcode = result.barcodes[0];
      print(
          "File '$barcodeImageUrl' recognized, results: value: '${barcode.barcodeValue}', type: ${barcode.type}");
    } else {
      print("File '$barcodeImageUrl' recognized, but no barcodes found.");
    }
  });
}
