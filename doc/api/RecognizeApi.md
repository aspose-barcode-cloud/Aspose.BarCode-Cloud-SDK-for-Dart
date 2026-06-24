# aspose_barcode_cloud.api.RecognizeApi

## Load the API package
```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```

All URIs are relative to *https://api.aspose.cloud/v4.0*

Method | HTTP request | Description
------ | ------------ | -----------
[**recognize**](RecognizeApi.md#recognize) | **GET** /barcode/recognize | Recognize a barcode from a file on an Internet server using a GET request with a query string parameter. For recognizing files from your hard drive, use &#x60;recognize-body&#x60; or &#x60;recognize-multipart&#x60; endpoints instead.
[**recognizeBase64**](RecognizeApi.md#recognizeBase64) | **POST** /barcode/recognize-body | Recognize a barcode from a file in the request body using a POST request with JSON or XML body parameters.
[**recognizeMultipart**](RecognizeApi.md#recognizeMultipart) | **POST** /barcode/recognize-multipart | Recognize a barcode from a file in the request body using a POST request with multipart form parameters.


# **recognize**
> BarcodeResponseList recognize(barcodeType, fileUrl, recognitionMode, recognitionImageKind)

Recognize a barcode from a file on an Internet server using a GET request with a query string parameter. For recognizing files from your hard drive, use `recognize-body` or `recognize-multipart` endpoints instead.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **barcodeType** | [**DecodeBarcodeType**](.md)| Type of barcode to recognize. | 
 **fileUrl** | **String**| URL to the barcode image. | 
 **recognitionMode** | [**RecognitionMode**](.md)| Recognition mode. | [optional] 
 **recognitionImageKind** | [**RecognitionImageKind**](.md)| Image kind for recognition. | [optional] 

### Return type

[**BarcodeResponseList**](BarcodeResponseList.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/xml


# **recognizeBase64**
> BarcodeResponseList recognizeBase64(recognizeBase64Request)

Recognize a barcode from a file in the request body using a POST request with JSON or XML body parameters.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **recognizeBase64Request** | [**RecognizeBase64Request**](RecognizeBase64Request.md)| Barcode recognition request. | 

### Return type

[**BarcodeResponseList**](BarcodeResponseList.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: application/json, application/xml


# **recognizeMultipart**
> BarcodeResponseList recognizeMultipart(barcodeType, file, recognitionMode, recognitionImageKind)

Recognize a barcode from a file in the request body using a POST request with multipart form parameters.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **barcodeType** | [**DecodeBarcodeType**](DecodeBarcodeType.md)| See https://reference.aspose.com/barcode/net/aspose.barcode.barcoderecognition/decodetype/ | 
 **file** | **MultipartFile****MultipartFile**| Barcode image file. | 
 **recognitionMode** | [**RecognitionMode**](RecognitionMode.md)| Recognition mode. | [optional] 
 **recognitionImageKind** | [**RecognitionImageKind**](RecognitionImageKind.md)| Image kind for recognition. | [optional] 

### Return type

[**BarcodeResponseList**](BarcodeResponseList.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, application/xml


