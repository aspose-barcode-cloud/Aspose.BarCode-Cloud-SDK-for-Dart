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
    "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}Pdf417.svg",
  );

  final Uint8List barcodeStream = await generateApi.generateMultipart(
    EncodeBarcodeType.Pdf417,
    "Aspose.BarCode.Cloud",
    barcodeImageParams: BarcodeImageParams()
      ..textLocation = CodeLocation.Above
      ..imageFormat = BarcodeImageFormat.Svg,
    pdf417Params: Pdf417Params()
      ..pdf417EncodeMode = Pdf417EncodeMode.Auto
      ..pdf417ErrorLevel = Pdf417ErrorLevel.Level2
      ..pdf417AspectRatio = 3,
  );

  file.writeAsBytes(barcodeStream);

  print("File '${file.path}' generated.");
}
