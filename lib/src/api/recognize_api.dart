import 'dart:typed_data' show Uint8List;

import 'package:http/http.dart' show MultipartFile;

import '../http/multipart_request_plus.dart';
import '../../aspose_barcode_cloud.dart';
import '../api_helper.dart';

/// RecognizeApi
class RecognizeApi {
  /// Constructor
  RecognizeApi(this._apiClient);

  final ApiClient _apiClient;

  ///
  /// Recognize a barcode from a file on an Internet server using a GET request with a query string parameter. For recognizing files from your hard drive, use &#x60;recognize-body&#x60; or &#x60;recognize-multipart&#x60; endpoints instead.
  ///
  Future<BarcodeResponseList> recognize(
      DecodeBarcodeType barcodeType, String fileUrl,
      {RecognitionMode? recognitionMode,
      RecognitionImageKind? recognitionImageKind}) async {
    // ignore: prefer_final_locals
    Object? postBody;

    // create path and map variables
    final String requestPath = "/barcode/recognize";

    // query params
    final List<QueryParam> queryParams = [];
    final Map<String, String> headerParams = {};
    final Map<String, String> formParams = {};
    queryParams.addAll(
        convertParametersForCollectionFormat("", "barcodeType", barcodeType));
    queryParams
        .addAll(convertParametersForCollectionFormat("", "fileUrl", fileUrl));
    if (recognitionMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "recognitionMode", recognitionMode));
    }
    if (recognitionImageKind != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "recognitionImageKind", recognitionImageKind));
    }

    final List<String> contentTypes = [];

    final String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    final List<String> authNames = ["JWT"];

    final response = await _apiClient.invokeAPI(requestPath, 'GET', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      ApiErrorResponse error;
      try {
        error = _apiClient.deserialize(response.body, 'ApiErrorResponse');
      } catch (e) {
        throw ApiException(response.statusCode, response.body);
      }
      throw ApiException.withResponse(
          response.statusCode,
          response.reasonPhrase == null
              ? "Api response error"
              : response.reasonPhrase!,
          error);
    } else {
      return _apiClient.deserialize(response.body, 'BarcodeResponseList')
          as BarcodeResponseList;
    }
  }

  ///
  /// Recognize a barcode from a file in the request body using a POST request with JSON or XML body parameters.
  ///
  Future<BarcodeResponseList> recognizeBase64(
      RecognizeBase64Request recognizeBase64Request) async {
    // ignore: prefer_final_locals
    Object? postBody = recognizeBase64Request;

    // create path and map variables
    final String requestPath = "/barcode/recognize-body";

    // query params
    final List<QueryParam> queryParams = [];
    final Map<String, String> headerParams = {};
    final Map<String, String> formParams = {};

    final List<String> contentTypes = ["application/json", "application/xml"];

    final String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    final List<String> authNames = ["JWT"];

    final response = await _apiClient.invokeAPI(
        requestPath,
        'POST',
        queryParams,
        postBody,
        headerParams,
        formParams,
        contentType,
        authNames);

    if (response.statusCode >= 400) {
      ApiErrorResponse error;
      try {
        error = _apiClient.deserialize(response.body, 'ApiErrorResponse');
      } catch (e) {
        throw ApiException(response.statusCode, response.body);
      }
      throw ApiException.withResponse(
          response.statusCode,
          response.reasonPhrase == null
              ? "Api response error"
              : response.reasonPhrase!,
          error);
    } else {
      return _apiClient.deserialize(response.body, 'BarcodeResponseList')
          as BarcodeResponseList;
    }
  }

  ///
  /// Recognize a barcode from a file in the request body using a POST request with multipart form parameters.
  ///
  Future<BarcodeResponseList> recognizeMultipart(
      DecodeBarcodeType barcodeType, Uint8List fileBytes,
      {RecognitionMode? recognitionMode,
      RecognitionImageKind? recognitionImageKind}) async {
    // ignore: prefer_final_locals
    Object? postBody;

    // create path and map variables
    final String requestPath = "/barcode/recognize-multipart";

    // query params
    final List<QueryParam> queryParams = [];
    final Map<String, String> headerParams = {};
    final Map<String, String> formParams = {};

    final List<String> contentTypes = ["multipart/form-data"];

    final String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    final List<String> authNames = ["JWT"];

    MultipartRequestPlus mp =
        MultipartRequestPlus('POST', Uri.parse(requestPath));

    mp.fields['barcodeType'] = [parameterToString(barcodeType)];

    mp.files.add(MultipartFile.fromBytes("file", fileBytes.toList(),
        filename: "somefile.xyz"));

    if (recognitionMode != null) {
      mp.fields['recognitionMode'] = [parameterToString(recognitionMode)];
    }

    if (recognitionImageKind != null) {
      mp.fields['recognitionImageKind'] = [
        parameterToString(recognitionImageKind)
      ];
    }

    postBody = mp;

    final response = await _apiClient.invokeAPI(
        requestPath,
        'POST',
        queryParams,
        postBody,
        headerParams,
        formParams,
        contentType,
        authNames);

    if (response.statusCode >= 400) {
      ApiErrorResponse error;
      try {
        error = _apiClient.deserialize(response.body, 'ApiErrorResponse');
      } catch (e) {
        throw ApiException(response.statusCode, response.body);
      }
      throw ApiException.withResponse(
          response.statusCode,
          response.reasonPhrase == null
              ? "Api response error"
              : response.reasonPhrase!,
          error);
    } else {
      return _apiClient.deserialize(response.body, 'BarcodeResponseList')
          as BarcodeResponseList;
    }
  }
}
