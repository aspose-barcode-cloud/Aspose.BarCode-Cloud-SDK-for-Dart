# Aspose.BarCode Cloud SDK for Dart

[![Dart test](https://github.com/aspose-barcode-cloud/Aspose.BarCode-Cloud-SDK-for-Dart/actions/workflows/dart.yml/badge.svg?branch=main)](https://github.com/aspose-barcode-cloud/Aspose.BarCode-Cloud-SDK-for-Dart/actions/workflows/dart.yml)

- API version: 4.0
- SDK version: 4.26.3

## SDK and API Version Compatibility:

- SDK Version 4.25.1 and Later: Starting from SDK version 25.1, all subsequent versions are compatible with API Version v4.0.
- SDK Version 1.24.12 and Earlier: These versions are compatible with API Version v3.0.

This SDK allows you to work with Aspose.BarCode for Cloud REST APIs in your Dart or Flutter applications quickly and easily

## Demo applications

[Scan QR](https://products.aspose.app/barcode/scanqr) | [Generate Barcode](https://products.aspose.app/barcode/generate) | [Recognize Barcode](https://products.aspose.app/barcode/recognize)
:---: | :---: | :---:
[![ScanQR](https://products.aspose.app/barcode/scanqr/img/aspose_scanqr-app-48.png)](https://products.aspose.app/barcode/scanqr) | [![Generate](https://products.aspose.app/barcode/generate/img/aspose_generate-app-48.png)](https://products.aspose.app/barcode/generate) | [![Recognize](https://products.aspose.app/barcode/recognize/img/aspose_recognize-app-48.png)](https://products.aspose.app/barcode/recognize)
[**Generate Wi-Fi QR**](https://products.aspose.app/barcode/wifi-qr) | [**Embed Barcode**](https://products.aspose.app/barcode/embed) | [**Scan Barcode**](https://products.aspose.app/barcode/scan)
[![Wi-FiQR](https://products.aspose.app/barcode/embed/img/aspose_wifi-qr-app-48.png)](https://products.aspose.app/barcode/wifi-qr) | [![Embed](https://products.aspose.app/barcode/embed/img/aspose_embed-app-48.png)](https://products.aspose.app/barcode/embed) | [![Scan](https://products.aspose.app/barcode/embed/img/aspose_scan-app-48.png)](https://products.aspose.app/barcode/scan)

[Aspose.BarCode for Cloud](https://products.aspose.cloud/barcode/) is a REST API for Linear, 2D and postal barcode generation and recognition in the cloud. API recognizes and generates barcode images in a variety of formats. Barcode REST API allows to specify barcode image attributes like image width, height, border style and output image format in order to customize the generation process. Developers can also specify the barcode type and text attributes such as text location and font styles in order to suit the application requirements.

This repository contains Aspose.BarCode Cloud SDK for Dart source code. This SDK allows you to work with Aspose.BarCode for Cloud REST APIs in your Dart or Flutter applications quickly and easily.

To use these SDKs, you will need Client Id and Client Secret which can be looked up at [Aspose Cloud Dashboard](https://dashboard.aspose.cloud/applications) (free registration in Aspose Cloud is required for this).

## AI Agent Skills

This repository includes an AI-agent skill in [`skills/aspose-barcode-cloud-dart/SKILL.md`](skills/aspose-barcode-cloud-dart/SKILL.md). Point your coding agent to it when working with this SDK so it follows the repo workflow and SDK-specific API patterns.

## Prerequisites

To use Aspose.BarCode Cloud SDK for Dart you need to register an account with [Aspose Cloud](https://www.aspose.cloud) and lookup/create Client Secret and SID at [Cloud Dashboard](https://dashboard.aspose.cloud/applications). There is a free quota available. For more details, see [Aspose Cloud Pricing](https://purchase.aspose.cloud/).

## Requirements

Dart 2.12.0 or later

## Installation & Usage
Add this dependency to your *pubspec.yaml*:

```yaml
dependencies:
  aspose_barcode_cloud: 4.26.3
```

## Sample usage

### Generate an image with barcode and then recognize it

The examples below show how you can generate QR barcode and save it into a local file and then recognize using **aspose_barcode_cloud**:

```dart
import 'dart:io';
import 'dart:typed_data';

import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';

Future<void> main() async {
  final fileName = "test_data${Platform.pathSeparator}qr.png";

  final client = ApiClient(Configuration(
    clientId: "Client Id from https://dashboard.aspose.cloud/applications",
    clientSecret:
        "Client Secret from https://dashboard.aspose.cloud/applications",
    // For testing only
    accessToken: Platform.environment["TEST_CONFIGURATION_ACCESS_TOKEN"],
  ));

  final genApi = GenerateApi(client);
  final scanApi = ScanApi(client);
  // Generate image with barcode
  final Uint8List generated =
      await genApi.generate(EncodeBarcodeType.QR, "text");

  // Save generated image to file
  File(fileName).writeAsBytesSync(generated);
  print("Generated image saved to '$fileName'");

  // Recognize generated image

  final BarcodeResponseList recognized = await scanApi.scanMultipart(generated);

  if (recognized.barcodes.isNotEmpty) {
    print("Recognized Type: ${recognized.barcodes[0].type!}");
    print("Recognized Value: ${recognized.barcodes[0].barcodeValue!}");
  } else {
    print("No barcode found");
  }
}

```

## Dependencies

- http: '>=0.13.0 <2.0.0'

## Licensing

All Aspose.BarCode for Cloud SDKs, helper scripts and templates are licensed under [MIT License](LICENSE).

## Resources

- [**Website**](https://www.aspose.cloud)
- [**Product Home**](https://products.aspose.cloud/barcode/)
- [**Documentation**](https://docs.aspose.cloud/barcode/)
- [**Free Support Forum**](https://forum.aspose.cloud/c/barcode)
- [**Paid Support Helpdesk**](https://helpdesk.aspose.cloud/)
- [**Blog**](https://blog.aspose.cloud/categories/aspose.barcode-cloud-product-family/)

## Documentation for API Endpoints

All URIs are relative to *<https://api.aspose.cloud/v4.0>*

Class | Method | HTTP request | Description
----- | ------ | ------------ | -----------
*GenerateApi* | [**generate**](doc/api/GenerateApi.md#generate) | **GET** /barcode/generate/{barcodeType} | Generate barcode using GET request with parameters in route and query string.
*GenerateApi* | [**generateBody**](doc/api/GenerateApi.md#generatebody) | **POST** /barcode/generate-body | Generate barcode using POST request with parameters in body in json or xml format.
*GenerateApi* | [**generateMultipart**](doc/api/GenerateApi.md#generatemultipart) | **POST** /barcode/generate-multipart | Generate barcode using POST request with parameters in multipart form.
*RecognizeApi* | [**recognize**](doc/api/RecognizeApi.md#recognize) | **GET** /barcode/recognize | Recognize barcode from file on server in the Internet using GET requests with parameter in query string. For recognizing files from your hard drive use &#x60;recognize-body&#x60; or &#x60;recognize-multipart&#x60; endpoints instead.
*RecognizeApi* | [**recognizeBase64**](doc/api/RecognizeApi.md#recognizebase64) | **POST** /barcode/recognize-body | Recognize barcode from file in request body using POST requests with parameters in body in json or xml format.
*RecognizeApi* | [**recognizeMultipart**](doc/api/RecognizeApi.md#recognizemultipart) | **POST** /barcode/recognize-multipart | Recognize barcode from file in request body using POST requests with parameters in multipart form.
*ScanApi* | [**scan**](doc/api/ScanApi.md#scan) | **GET** /barcode/scan | Scan barcode from file on server in the Internet using GET requests with parameter in query string. For scaning files from your hard drive use &#x60;scan-body&#x60; or &#x60;scan-multipart&#x60; endpoints instead.
*ScanApi* | [**scanBase64**](doc/api/ScanApi.md#scanbase64) | **POST** /barcode/scan-body | Scan barcode from file in request body using POST requests with parameter in body in json or xml format.
*ScanApi* | [**scanMultipart**](doc/api/ScanApi.md#scanmultipart) | **POST** /barcode/scan-multipart | Scan barcode from file in request body using POST requests with parameter in multipart form.

## Documentation For Models

- [ApiError](doc/models/ApiError.md)
- [ApiErrorResponse](doc/models/ApiErrorResponse.md)
- [BarcodeImageFormat](doc/models/BarcodeImageFormat.md)
- [BarcodeImageParams](doc/models/BarcodeImageParams.md)
- [BarcodeResponse](doc/models/BarcodeResponse.md)
- [BarcodeResponseList](doc/models/BarcodeResponseList.md)
- [CodeLocation](doc/models/CodeLocation.md)
- [DecodeBarcodeType](doc/models/DecodeBarcodeType.md)
- [EncodeBarcodeType](doc/models/EncodeBarcodeType.md)
- [EncodeData](doc/models/EncodeData.md)
- [EncodeDataType](doc/models/EncodeDataType.md)
- [GenerateParams](doc/models/GenerateParams.md)
- [GraphicsUnit](doc/models/GraphicsUnit.md)
- [RecognitionImageKind](doc/models/RecognitionImageKind.md)
- [RecognitionMode](doc/models/RecognitionMode.md)
- [RecognizeBase64Request](doc/models/RecognizeBase64Request.md)
- [RegionPoint](doc/models/RegionPoint.md)
- [ScanBase64Request](doc/models/ScanBase64Request.md)

