import 'dart:typed_data' show Uint8List;

import '../http/multipart_request_plus.dart';
import '../../aspose_barcode_cloud.dart';
import '../api_helper.dart';

/// GenerateApi
class GenerateApi {
  /// Constructor
  GenerateApi(this._apiClient);

  final ApiClient _apiClient;

  ///
  /// Generate a barcode using a GET request with parameters in the route and query string.
  ///
  Future<Uint8List> generate(EncodeBarcodeType barcodeType, String data,
      {EncodeDataType? dataType,
      BarcodeImageFormat? imageFormat,
      CodeLocation? textLocation,
      String? foregroundColor,
      String? backgroundColor,
      GraphicsUnit? units,
      double? resolution,
      double? imageHeight,
      double? imageWidth,
      int? rotationAngle,
      QREncodeMode? qrEncodeMode,
      QRErrorLevel? qrErrorLevel,
      QRVersion? qrVersion,
      ECIEncodings? qrECIEncoding,
      double? qrAspectRatio,
      MicroQRVersion? microQRVersion,
      RectMicroQRVersion? rectMicroQrVersion,
      Code128EncodeMode? code128EncodeMode,
      Pdf417EncodeMode? pdf417EncodeMode,
      Pdf417ErrorLevel? pdf417ErrorLevel,
      bool? pdf417Truncate,
      int? pdf417Columns,
      int? pdf417Rows,
      double? pdf417AspectRatio,
      ECIEncodings? pdf417ECIEncoding,
      bool? pdf417IsReaderInitialization,
      MacroCharacter? pdf417MacroCharacters,
      bool? pdf417IsLinked,
      bool? pdf417IsCode128Emulation}) async {
    // ignore: prefer_final_locals
    Object? postBody;

    // create path and map variables
    final String requestPath = "/barcode/generate/{barcodeType}"
        .replaceAll('{' 'barcodeType' '}', barcodeType.toString());

    // query params
    final List<QueryParam> queryParams = [];
    final Map<String, String> headerParams = {};
    final Map<String, String> formParams = {};
    if (dataType != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "dataType", dataType));
    }
    queryParams.addAll(convertParametersForCollectionFormat("", "data", data));
    if (imageFormat != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "imageFormat", imageFormat));
    }
    if (textLocation != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "textLocation", textLocation));
    }
    if (foregroundColor != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "foregroundColor", foregroundColor));
    }
    if (backgroundColor != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "backgroundColor", backgroundColor));
    }
    if (units != null) {
      queryParams
          .addAll(convertParametersForCollectionFormat("", "units", units));
    }
    if (resolution != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "resolution", resolution));
    }
    if (imageHeight != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "imageHeight", imageHeight));
    }
    if (imageWidth != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "imageWidth", imageWidth));
    }
    if (rotationAngle != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "rotationAngle", rotationAngle));
    }
    if (qrEncodeMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrEncodeMode", qrEncodeMode));
    }
    if (qrErrorLevel != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrErrorLevel", qrErrorLevel));
    }
    if (qrVersion != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "qrVersion", qrVersion));
    }
    if (qrECIEncoding != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrECIEncoding", qrECIEncoding));
    }
    if (qrAspectRatio != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrAspectRatio", qrAspectRatio));
    }
    if (microQRVersion != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "microQRVersion", microQRVersion));
    }
    if (rectMicroQrVersion != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "rectMicroQrVersion", rectMicroQrVersion));
    }
    if (code128EncodeMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "code128EncodeMode", code128EncodeMode));
    }
    if (pdf417EncodeMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417EncodeMode", pdf417EncodeMode));
    }
    if (pdf417ErrorLevel != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417ErrorLevel", pdf417ErrorLevel));
    }
    if (pdf417Truncate != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417Truncate", pdf417Truncate));
    }
    if (pdf417Columns != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417Columns", pdf417Columns));
    }
    if (pdf417Rows != null) {
      queryParams.addAll(
          convertParametersForCollectionFormat("", "pdf417Rows", pdf417Rows));
    }
    if (pdf417AspectRatio != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417AspectRatio", pdf417AspectRatio));
    }
    if (pdf417ECIEncoding != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417ECIEncoding", pdf417ECIEncoding));
    }
    if (pdf417IsReaderInitialization != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417IsReaderInitialization", pdf417IsReaderInitialization));
    }
    if (pdf417MacroCharacters != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417MacroCharacters", pdf417MacroCharacters));
    }
    if (pdf417IsLinked != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417IsLinked", pdf417IsLinked));
    }
    if (pdf417IsCode128Emulation != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417IsCode128Emulation", pdf417IsCode128Emulation));
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
      return response.bodyBytes;
    }
  }

  ///
  /// Generate a barcode using a POST request with parameters in the request body in JSON or XML format.
  ///
  Future<Uint8List> generateBody(GenerateParams generateParams) async {
    // ignore: prefer_final_locals
    Object? postBody = generateParams;

    // create path and map variables
    final String requestPath = "/barcode/generate-body";

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
      return response.bodyBytes;
    }
  }

  ///
  /// Generate a barcode using a POST request with parameters in a multipart form.
  ///
  Future<Uint8List> generateMultipart(
      EncodeBarcodeType barcodeType, String data,
      {EncodeDataType? dataType,
      BarcodeImageFormat? imageFormat,
      CodeLocation? textLocation,
      String? foregroundColor,
      String? backgroundColor,
      GraphicsUnit? units,
      double? resolution,
      double? imageHeight,
      double? imageWidth,
      int? rotationAngle,
      QREncodeMode? qrEncodeMode,
      QRErrorLevel? qrErrorLevel,
      QRVersion? qrVersion,
      ECIEncodings? qrECIEncoding,
      double? qrAspectRatio,
      MicroQRVersion? microQRVersion,
      RectMicroQRVersion? rectMicroQrVersion,
      Code128EncodeMode? code128EncodeMode,
      Pdf417EncodeMode? pdf417EncodeMode,
      Pdf417ErrorLevel? pdf417ErrorLevel,
      bool? pdf417Truncate,
      int? pdf417Columns,
      int? pdf417Rows,
      double? pdf417AspectRatio,
      ECIEncodings? pdf417ECIEncoding,
      bool? pdf417IsReaderInitialization,
      MacroCharacter? pdf417MacroCharacters,
      bool? pdf417IsLinked,
      bool? pdf417IsCode128Emulation}) async {
    // ignore: prefer_final_locals
    Object? postBody;

    // create path and map variables
    final String requestPath = "/barcode/generate-multipart";

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

    if (dataType != null) {
      mp.fields['dataType'] = [parameterToString(dataType)];
    }

    mp.fields['data'] = [parameterToString(data)];

    if (imageFormat != null) {
      mp.fields['imageFormat'] = [parameterToString(imageFormat)];
    }

    if (textLocation != null) {
      mp.fields['textLocation'] = [parameterToString(textLocation)];
    }

    if (foregroundColor != null) {
      mp.fields['foregroundColor'] = [parameterToString(foregroundColor)];
    }

    if (backgroundColor != null) {
      mp.fields['backgroundColor'] = [parameterToString(backgroundColor)];
    }

    if (units != null) {
      mp.fields['units'] = [parameterToString(units)];
    }

    if (resolution != null) {
      mp.fields['resolution'] = [parameterToString(resolution)];
    }

    if (imageHeight != null) {
      mp.fields['imageHeight'] = [parameterToString(imageHeight)];
    }

    if (imageWidth != null) {
      mp.fields['imageWidth'] = [parameterToString(imageWidth)];
    }

    if (rotationAngle != null) {
      mp.fields['rotationAngle'] = [parameterToString(rotationAngle)];
    }

    if (qrEncodeMode != null) {
      mp.fields['qrEncodeMode'] = [parameterToString(qrEncodeMode)];
    }

    if (qrErrorLevel != null) {
      mp.fields['qrErrorLevel'] = [parameterToString(qrErrorLevel)];
    }

    if (qrVersion != null) {
      mp.fields['qrVersion'] = [parameterToString(qrVersion)];
    }

    if (qrECIEncoding != null) {
      mp.fields['qrECIEncoding'] = [parameterToString(qrECIEncoding)];
    }

    if (qrAspectRatio != null) {
      mp.fields['qrAspectRatio'] = [parameterToString(qrAspectRatio)];
    }

    if (microQRVersion != null) {
      mp.fields['microQRVersion'] = [parameterToString(microQRVersion)];
    }

    if (rectMicroQrVersion != null) {
      mp.fields['rectMicroQrVersion'] = [parameterToString(rectMicroQrVersion)];
    }

    if (code128EncodeMode != null) {
      mp.fields['code128EncodeMode'] = [parameterToString(code128EncodeMode)];
    }

    if (pdf417EncodeMode != null) {
      mp.fields['pdf417EncodeMode'] = [parameterToString(pdf417EncodeMode)];
    }

    if (pdf417ErrorLevel != null) {
      mp.fields['pdf417ErrorLevel'] = [parameterToString(pdf417ErrorLevel)];
    }

    if (pdf417Truncate != null) {
      mp.fields['pdf417Truncate'] = [parameterToString(pdf417Truncate)];
    }

    if (pdf417Columns != null) {
      mp.fields['pdf417Columns'] = [parameterToString(pdf417Columns)];
    }

    if (pdf417Rows != null) {
      mp.fields['pdf417Rows'] = [parameterToString(pdf417Rows)];
    }

    if (pdf417AspectRatio != null) {
      mp.fields['pdf417AspectRatio'] = [parameterToString(pdf417AspectRatio)];
    }

    if (pdf417ECIEncoding != null) {
      mp.fields['pdf417ECIEncoding'] = [parameterToString(pdf417ECIEncoding)];
    }

    if (pdf417IsReaderInitialization != null) {
      mp.fields['pdf417IsReaderInitialization'] = [
        parameterToString(pdf417IsReaderInitialization)
      ];
    }

    if (pdf417MacroCharacters != null) {
      mp.fields['pdf417MacroCharacters'] = [
        parameterToString(pdf417MacroCharacters)
      ];
    }

    if (pdf417IsLinked != null) {
      mp.fields['pdf417IsLinked'] = [parameterToString(pdf417IsLinked)];
    }

    if (pdf417IsCode128Emulation != null) {
      mp.fields['pdf417IsCode128Emulation'] = [
        parameterToString(pdf417IsCode128Emulation)
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
      return response.bodyBytes;
    }
  }
}
