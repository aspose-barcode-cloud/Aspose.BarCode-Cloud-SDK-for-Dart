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
      '${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}Code39.png';

  final Uint8List response = await generateApi.generateMultipart(
    EncodeBarcodeType.Code39,
    "Aspose",
    barcodeImageParams: BarcodeImageParams()
      ..foregroundColor = "Green"
      ..backgroundColor = "Yellow"
      ..imageFormat = BarcodeImageFormat.Gif,
  );

  await File(fileName).writeAsBytes(response);

  print("File '$fileName' generated.");
}
