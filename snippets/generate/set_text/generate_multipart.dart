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
  final fileName =
      "${Directory.current.path}${Platform.pathSeparator}test_data${Platform.pathSeparator}Code128.png";
  final configuration = makeConfiguration();
  final apiClient = ApiClient(configuration);
  final generateApi = GenerateApi(apiClient);

  final Uint8List response = await generateApi.generateMultipart(
    EncodeBarcodeType.Code128,
    "4173706F73652E426172436F64652E436C6F7564",
    dataType: EncodeDataType.HexBytes,
    code128Params: Code128Params()..code128EncodeMode = Code128EncodeMode.Auto,
  );

  final file = File(fileName);
  await file.writeAsBytes(response);

  print("File '${file.path}' generated.");
}
