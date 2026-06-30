# aspose_barcode_cloud.api.ScanApi

## Load the API package
```dart
import 'package:aspose_barcode_cloud/aspose_barcode_cloud.dart';
```

All URIs are relative to *https://api.aspose.cloud/v4.0*

Method | HTTP request | Description
------ | ------------ | -----------
[**scan**](ScanApi.md#scan) | **GET** /barcode/scan | Scan a barcode from a file on an Internet server using a GET request with a query string parameter. For scanning files from your hard drive, use &#x60;scan-body&#x60; or &#x60;scan-multipart&#x60; endpoints instead.
[**scanBase64**](ScanApi.md#scanBase64) | **POST** /barcode/scan-body | Scan a barcode from a file in the request body using a POST request with a JSON or XML body parameter.
[**scanMultipart**](ScanApi.md#scanMultipart) | **POST** /barcode/scan-multipart | Scan a barcode from a file in the request body using a POST request with a multipart form parameter.


# **scan**
> BarcodeResponseList scan(fileUrl)

Scan a barcode from a file on an Internet server using a GET request with a query string parameter. For scanning files from your hard drive, use `scan-body` or `scan-multipart` endpoints instead.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **fileUrl** | **String**| URL to the barcode image. | 

### Return type

[**BarcodeResponseList**](BarcodeResponseList.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/xml


# **scanBase64**
> BarcodeResponseList scanBase64(scanBase64Request)

Scan a barcode from a file in the request body using a POST request with a JSON or XML body parameter.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **scanBase64Request** | [**ScanBase64Request**](ScanBase64Request.md)| Barcode scan request. | 

### Return type

[**BarcodeResponseList**](BarcodeResponseList.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: application/json, application/xml


# **scanMultipart**
> BarcodeResponseList scanMultipart(file)

Scan a barcode from a file in the request body using a POST request with a multipart form parameter.

### Parameters

Name | Type | Description  | Notes
---- | ---- | ------------ | -----
 **file** | **MultipartFile****MultipartFile**| Barcode image file. | 

### Return type

[**BarcodeResponseList**](BarcodeResponseList.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, application/xml


