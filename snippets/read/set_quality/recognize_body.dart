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
  final recognizeApi = RecognizeApi(ApiClient(config));

  final fileName = File(
          "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}Pdf417.png")
      .absolute
      .path;
  final fileBytes = File(fileName).readAsBytesSync();
  final imageBase64 = base64Encode(fileBytes);

  final recognizeBase64Request = RecognizeBase64Request(
    [DecodeBarcodeType.Pdf417],
    imageBase64,
  )..recognitionMode = RecognitionMode.Excellent;

  final BarcodeResponseList result =
      await recognizeApi.recognizeBase64(recognizeBase64Request);

  print(
      "File '$fileName' recognized, result: '${result.barcodes[0].barcodeValue}'");
}
