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
  await ApiClient(configuration).use((apiClient) async {
    final generateApi = GenerateApi(apiClient);

    final file = File(
      "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}Pdf417.png",
    );

    final imageParams = BarcodeImageParams();
    imageParams.foregroundColor = "#FF5733";
    imageParams.backgroundColor = "#FFFFFF";
    imageParams.imageFormat = BarcodeImageFormat.Jpeg;

    final generateParams = GenerateParams(
      EncodeBarcodeType.Pdf417,
      EncodeData("Aspose.BarCode.Cloud", EncodeDataType.StringData),
      imageParams,
    );

    final Uint8List response = await generateApi.generateBody(generateParams);

    await file.writeAsBytes(response);

    print("File '${file.path}' generated.");
  });
}
