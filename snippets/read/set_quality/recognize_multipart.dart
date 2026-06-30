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

  final file = await File(
          "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}aztec.png")
      .readAsBytes();

  final BarcodeResponseList result = await recognizeApi.recognizeMultipart(
    DecodeBarcodeType.Aztec,
    file,
    recognitionMode: RecognitionMode.Normal,
    recognitionImageKind: RecognitionImageKind.ScannedDocument,
  );

  print("File recognized, result: '${result.barcodes[0].barcodeValue}'");
}
