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

  final file = File(
    "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}QrCustom.jpeg",
  );

  final imageParams = BarcodeImageParams()
    ..foregroundColor = "#FF0000"
    ..backgroundColor = "#FFFF00"
    ..imageFormat = BarcodeImageFormat.Jpeg
    ..rotationAngle = 90;

  final generateParams = GenerateParams(
      EncodeBarcodeType.QR,
      EncodeData("Aspose", EncodeDataType.StringData),
      imageParams,
      QrParams(
        QREncodeMode.Auto,
        QRErrorLevel.LevelM,
        QRVersion.Auto,
        null,
        0.75,
      ));

  final Uint8List response = await generateApi.generateBody(generateParams);

  file.writeAsBytes(response);

  print("File '${file.path}' generated.");
}
