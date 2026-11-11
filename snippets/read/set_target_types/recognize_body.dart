import 'dart:convert';
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

    final fileName = File(
            "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}qr_and_code128.png")
        .absolute
        .path;
    final fileBytes = File(fileName).readAsBytesSync();
    final imageBase64 = base64Encode(fileBytes);

    final recognizeBase64Request = RecognizeBase64Request(
      [DecodeBarcodeType.QR, DecodeBarcodeType.Code128],
      imageBase64,
    );

    final BarcodeResponseList result =
        await recognizeApi.recognizeBase64(recognizeBase64Request);

    print("File '$fileName' recognized, results: ");
    for (final barcode in result.barcodes) {
      print("Value: '${barcode.barcodeValue}', type: ${barcode.type}");
    }
  });
}
