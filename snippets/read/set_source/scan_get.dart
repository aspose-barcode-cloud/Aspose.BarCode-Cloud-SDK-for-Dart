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
  final scanApi = ScanApi(ApiClient(config));

  final barcodeImageUrl =
      "https://raw.githubusercontent.com/aspose-barcode-cloud/Aspose.BarCode-Cloud-SDK-for-Dart/main/test_data/qr_and_code128.png";

  final BarcodeResponseList result = await scanApi.scan(barcodeImageUrl);

  if (result.barcodes.isNotEmpty) {
    final barcode = result.barcodes[0];
    print(
        "File '$barcodeImageUrl' recognized, results: value: '${barcode.barcodeValue}', type: ${barcode.type}");
  } else {
    print("File '$barcodeImageUrl' recognized, but no barcodes found.");
  }
}
