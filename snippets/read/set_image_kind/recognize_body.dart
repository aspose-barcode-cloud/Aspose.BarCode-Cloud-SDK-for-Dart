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
            "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}aztec.png")
        .absolute
        .path;
    final fileBytes = File(fileName).readAsBytesSync();
    final imageBase64 = base64Encode(fileBytes);

    final recognizeBase64Request = RecognizeBase64Request(
      [DecodeBarcodeType.Aztec, DecodeBarcodeType.QR],
      imageBase64,
    )..recognitionImageKind = RecognitionImageKind.ScannedDocument;

    final BarcodeResponseList result =
        await recognizeApi.recognizeBase64(recognizeBase64Request);

    if (result.barcodes.isNotEmpty) {
      final barcode = result.barcodes[0];
      print(
          "File '$fileName' recognized, results: value: '${barcode.barcodeValue}', type: ${barcode.type}");
    } else {
      print("File '$fileName' recognized, but no barcodes found.");
    }
  });
}
