# aspose_barcode_cloud.api.GenerateApi

## Load the API package
```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```

All URIs are relative to *https://api.aspose.cloud/v4.0*

Method | HTTP request | Description
------ | ------------ | -----------
[**generate**](GenerateApi.md#generate) | **GET** /barcode/generate/{barcodeType} | Generate a barcode using a GET request with parameters in the route and query string.
[**generateBody**](GenerateApi.md#generateBody) | **POST** /barcode/generate-body | Generate a barcode using a POST request with parameters in the request body in JSON or XML format.
[**generateMultipart**](GenerateApi.md#generateMultipart) | **POST** /barcode/generate-multipart | Generate a barcode using a POST request with parameters in a multipart form.


# **generate**
> MultipartFile generate(barcodeType, data, dataType, imageFormat, textLocation, foregroundColor, backgroundColor, units, resolution, imageHeight, imageWidth, rotationAngle, qrEncodeMode, qrErrorLevel, qrVersion, qrECIEncoding, qrAspectRatio, microQRVersion, rectMicroQrVersion, code128EncodeMode, pdf417EncodeMode, pdf417ErrorLevel, pdf417Truncate, pdf417Columns, pdf417Rows, pdf417AspectRatio, pdf417ECIEncoding, pdf417IsReaderInitialization, pdf417MacroCharacters, pdf417IsLinked, pdf417IsCode128Emulation)

Generate a barcode using a GET request with parameters in the route and query string.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **barcodeType** | [**EncodeBarcodeType**](.md)| Type of barcode to generate. | 
 **data** | **String**| String that represents the data to encode. | 
 **dataType** | [**EncodeDataType**](.md)| Type of data to encode. Default value: StringData. | [optional] [default to StringData]
 **imageFormat** | [**BarcodeImageFormat**](.md)| Barcode output image format. Default value: png. | [optional] [default to Png]
 **textLocation** | [**CodeLocation**](.md)| Specify the displayed text location. Set to CodeLocation.None to hide CodeText. Default value depends on BarcodeType: CodeLocation.Below for 1D barcodes and CodeLocation.None for 2D barcodes. | [optional] 
 **foregroundColor** | **String**| Specify the display color for bars and content. Value: Color name from https://reference.aspose.com/drawing/net/system.drawing/color/ or ARGB value starting with #. For example: AliceBlue or #FF000000. Default value: Black. | [optional] [default to &#39;Black&#39;]
 **backgroundColor** | **String**| Background color of the barcode image. Value: Color name from https://reference.aspose.com/drawing/net/system.drawing/color/ or ARGB value starting with #. For example: AliceBlue or #FF000000. Default value: White. | [optional] [default to &#39;White&#39;]
 **units** | [**GraphicsUnit**](.md)| Common units for all measurements. Default units: pixels. | [optional] 
 **resolution** | **double**| Resolution of the barcode image. One value for both dimensions. Default value: 96 dpi. Decimal separator is a dot. | [optional] 
 **imageHeight** | **double**| Height of the barcode image in the specified units. Default units: pixels. Decimal separator is a dot. | [optional] 
 **imageWidth** | **double**| Width of the barcode image in the specified units. Default units: pixels. Decimal separator is a dot. | [optional] 
 **rotationAngle** | **int**| Barcode image rotation angle, measured in degrees. For example, RotationAngle &#x3D; 0 or RotationAngle &#x3D; 360 means no rotation. If RotationAngle is not equal to 90, 180, 270, or 0, it may increase the difficulty for the scanner to read the image. Default value: 0. | [optional] 
 **qrEncodeMode** | [**QREncodeMode**](.md)| QR barcode encode mode. | [optional] 
 **qrErrorLevel** | [**QRErrorLevel**](.md)| QR barcode error correction level. | [optional] 
 **qrVersion** | [**QRVersion**](.md)| QR barcode version. Automatically selects the smallest version that fits the data. | [optional] 
 **qrECIEncoding** | [**ECIEncodings**](.md)| ECI encoding for QR barcode data. | [optional] 
 **qrAspectRatio** | **double**| QR barcode aspect ratio. Values: 0 to 1. | [optional] 
 **microQRVersion** | [**MicroQRVersion**](.md)| MicroQR barcode version. Used when BarcodeType is MicroQR. | [optional] 
 **rectMicroQrVersion** | [**RectMicroQRVersion**](.md)| RectMicroQR barcode version. Used when BarcodeType is RectMicroQR. | [optional] 
 **code128EncodeMode** | [**Code128EncodeMode**](.md)| Code128 barcode encode mode. Controls which Code 128 subset (A, B, C, or mix) is used. | [optional] 
 **pdf417EncodeMode** | [**Pdf417EncodeMode**](.md)| PDF417 barcode encode mode. | [optional] 
 **pdf417ErrorLevel** | [**Pdf417ErrorLevel**](.md)| PDF417 barcode error correction level. | [optional] 
 **pdf417Truncate** | **bool**| Whether to use truncated PDF417 format (removes right-side stop pattern). | [optional] 
 **pdf417Columns** | **int**| Number of columns in the PDF417 barcode. Values between 1 and 30. 0 for auto. | [optional] 
 **pdf417Rows** | **int**| Number of rows in the PDF417 barcode. Values between 3 and 90. 0 for automatic. | [optional] 
 **pdf417AspectRatio** | **double**| PDF417 barcode aspect ratio (height/width of the barcode module). Values are defined by the standard: 2 to 5 for MicroPdf417; 3 to 5 for Pdf417 and MacroPdf417. | [optional] 
 **pdf417ECIEncoding** | [**ECIEncodings**](.md)| ECI encoding for PDF417 barcode data. | [optional] 
 **pdf417IsReaderInitialization** | **bool**| Whether the barcode is used for reader initialization (programming). | [optional] 
 **pdf417MacroCharacters** | [**MacroCharacter**](.md)| Macro character to prepend (structured append). | [optional] 
 **pdf417IsLinked** | **bool**| Whether to use linked mode (for MicroPdf417). | [optional] 
 **pdf417IsCode128Emulation** | **bool**| Whether to use Code128 emulation for MicroPdf417. | [optional] 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/png, image/bmp, image/gif, image/jpeg, image/svg+xml, image/tiff, application/json, application/xml


# **generateBody**
> MultipartFile generateBody(generateParams)

Generate a barcode using a POST request with parameters in the request body in JSON or XML format.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **generateParams** | [**GenerateParams**](GenerateParams.md)| Generation parameters. | 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: image/png, image/bmp, image/gif, image/jpeg, image/svg+xml, image/tiff, application/json, application/xml


# **generateMultipart**
> MultipartFile generateMultipart(barcodeType, data, dataType, imageFormat, textLocation, foregroundColor, backgroundColor, units, resolution, imageHeight, imageWidth, rotationAngle, qrEncodeMode, qrErrorLevel, qrVersion, qrECIEncoding, qrAspectRatio, microQRVersion, rectMicroQrVersion, code128EncodeMode, pdf417EncodeMode, pdf417ErrorLevel, pdf417Truncate, pdf417Columns, pdf417Rows, pdf417AspectRatio, pdf417ECIEncoding, pdf417IsReaderInitialization, pdf417MacroCharacters, pdf417IsLinked, pdf417IsCode128Emulation)

Generate a barcode using a POST request with parameters in a multipart form.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **barcodeType** | [**EncodeBarcodeType**](EncodeBarcodeType.md)| See https://reference.aspose.com/barcode/net/aspose.barcode.generation/encodetypes/ | 
 **data** | **String**| String that represents the data to encode. | 
 **dataType** | [**EncodeDataType**](EncodeDataType.md)| Type of data to encode. Default value: StringData. | [optional] [default to StringData]
 **imageFormat** | [**BarcodeImageFormat**](BarcodeImageFormat.md)| Barcode output image format. Default value: png. | [optional] [default to Png]
 **textLocation** | [**CodeLocation**](CodeLocation.md)| Specify the displayed text location. Set to CodeLocation.None to hide CodeText. Default value depends on BarcodeType: CodeLocation.Below for 1D barcodes and CodeLocation.None for 2D barcodes. | [optional] 
 **foregroundColor** | **String**| Specify the display color for bars and content. Value: Color name from https://reference.aspose.com/drawing/net/system.drawing/color/ or ARGB value starting with #. For example: AliceBlue or #FF000000. Default value: Black. | [optional] [default to &#39;Black&#39;]
 **backgroundColor** | **String**| Background color of the barcode image. Value: Color name from https://reference.aspose.com/drawing/net/system.drawing/color/ or ARGB value starting with #. For example: AliceBlue or #FF000000. Default value: White. | [optional] [default to &#39;White&#39;]
 **units** | [**GraphicsUnit**](GraphicsUnit.md)| Common units for all measurements. Default units: pixels. | [optional] 
 **resolution** | **double**| Resolution of the barcode image. One value for both dimensions. Default value: 96 dpi. Decimal separator is a dot. | [optional] 
 **imageHeight** | **double**| Height of the barcode image in the specified units. Default units: pixels. Decimal separator is a dot. | [optional] 
 **imageWidth** | **double**| Width of the barcode image in the specified units. Default units: pixels. Decimal separator is a dot. | [optional] 
 **rotationAngle** | **int**| Barcode image rotation angle, measured in degrees. For example, RotationAngle &#x3D; 0 or RotationAngle &#x3D; 360 means no rotation. If RotationAngle is not equal to 90, 180, 270, or 0, it may increase the difficulty for the scanner to read the image. Default value: 0. | [optional] 
 **qrEncodeMode** | [**QREncodeMode**](QREncodeMode.md)| QR barcode encode mode. | [optional] 
 **qrErrorLevel** | [**QRErrorLevel**](QRErrorLevel.md)| QR barcode error correction level. | [optional] 
 **qrVersion** | [**QRVersion**](QRVersion.md)| QR barcode version. Automatically selects the smallest version that fits the data. | [optional] 
 **qrECIEncoding** | [**ECIEncodings**](ECIEncodings.md)| ECI encoding for QR barcode data. | [optional] 
 **qrAspectRatio** | **double**| QR barcode aspect ratio. Values: 0 to 1. | [optional] 
 **microQRVersion** | [**MicroQRVersion**](MicroQRVersion.md)| MicroQR barcode version. Used when BarcodeType is MicroQR. | [optional] 
 **rectMicroQrVersion** | [**RectMicroQRVersion**](RectMicroQRVersion.md)| RectMicroQR barcode version. Used when BarcodeType is RectMicroQR. | [optional] 
 **code128EncodeMode** | [**Code128EncodeMode**](Code128EncodeMode.md)| Code128 barcode encode mode. Controls which Code 128 subset (A, B, C, or mix) is used. | [optional] 
 **pdf417EncodeMode** | [**Pdf417EncodeMode**](Pdf417EncodeMode.md)| PDF417 barcode encode mode. | [optional] 
 **pdf417ErrorLevel** | [**Pdf417ErrorLevel**](Pdf417ErrorLevel.md)| PDF417 barcode error correction level. | [optional] 
 **pdf417Truncate** | **bool**| Whether to use truncated PDF417 format (removes right-side stop pattern). | [optional] 
 **pdf417Columns** | **int**| Number of columns in the PDF417 barcode. Values between 1 and 30. 0 for auto. | [optional] 
 **pdf417Rows** | **int**| Number of rows in the PDF417 barcode. Values between 3 and 90. 0 for automatic. | [optional] 
 **pdf417AspectRatio** | **double**| PDF417 barcode aspect ratio (height/width of the barcode module). Values are defined by the standard: 2 to 5 for MicroPdf417; 3 to 5 for Pdf417 and MacroPdf417. | [optional] 
 **pdf417ECIEncoding** | [**ECIEncodings**](ECIEncodings.md)| ECI encoding for PDF417 barcode data. | [optional] 
 **pdf417IsReaderInitialization** | **bool**| Whether the barcode is used for reader initialization (programming). | [optional] 
 **pdf417MacroCharacters** | [**MacroCharacter**](MacroCharacter.md)| Macro character to prepend (structured append). | [optional] 
 **pdf417IsLinked** | **bool**| Whether to use linked mode (for MicroPdf417). | [optional] 
 **pdf417IsCode128Emulation** | **bool**| Whether to use Code128 emulation for MicroPdf417. | [optional] 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: image/png, image/bmp, image/gif, image/jpeg, image/svg+xml, image/tiff, application/json, application/xml


