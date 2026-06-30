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
      BarcodeImageParams? barcodeImageParams,
      QrParams? qrParams,
      Code128Params? code128Params,
      Pdf417Params? pdf417Params}) async {
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
    if (barcodeImageParams?.imageFormat != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "imageFormat", barcodeImageParams!.imageFormat));
    }
    if (barcodeImageParams?.textLocation != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "textLocation", barcodeImageParams!.textLocation));
    }
    if (barcodeImageParams?.foregroundColor != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "foregroundColor", barcodeImageParams!.foregroundColor));
    }
    if (barcodeImageParams?.backgroundColor != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "backgroundColor", barcodeImageParams!.backgroundColor));
    }
    if (barcodeImageParams?.units != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "units", barcodeImageParams!.units));
    }
    if (barcodeImageParams?.resolution != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "resolution", barcodeImageParams!.resolution));
    }
    if (barcodeImageParams?.imageHeight != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "imageHeight", barcodeImageParams!.imageHeight));
    }
    if (barcodeImageParams?.imageWidth != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "imageWidth", barcodeImageParams!.imageWidth));
    }
    if (barcodeImageParams?.rotationAngle != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "rotationAngle", barcodeImageParams!.rotationAngle));
    }
    if (qrParams?.qrEncodeMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrEncodeMode", qrParams!.qrEncodeMode));
    }
    if (qrParams?.qrErrorLevel != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrErrorLevel", qrParams!.qrErrorLevel));
    }
    if (qrParams?.qrVersion != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrVersion", qrParams!.qrVersion));
    }
    if (qrParams?.qrECIEncoding != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrECIEncoding", qrParams!.qrECIEncoding));
    }
    if (qrParams?.qrAspectRatio != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "qrAspectRatio", qrParams!.qrAspectRatio));
    }
    if (qrParams?.microQRVersion != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "microQRVersion", qrParams!.microQRVersion));
    }
    if (qrParams?.rectMicroQrVersion != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "rectMicroQrVersion", qrParams!.rectMicroQrVersion));
    }
    if (code128Params?.code128EncodeMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "code128EncodeMode", code128Params!.code128EncodeMode));
    }
    if (pdf417Params?.pdf417EncodeMode != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417EncodeMode", pdf417Params!.pdf417EncodeMode));
    }
    if (pdf417Params?.pdf417ErrorLevel != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417ErrorLevel", pdf417Params!.pdf417ErrorLevel));
    }
    if (pdf417Params?.pdf417Truncate != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417Truncate", pdf417Params!.pdf417Truncate));
    }
    if (pdf417Params?.pdf417Columns != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417Columns", pdf417Params!.pdf417Columns));
    }
    if (pdf417Params?.pdf417Rows != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417Rows", pdf417Params!.pdf417Rows));
    }
    if (pdf417Params?.pdf417AspectRatio != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417AspectRatio", pdf417Params!.pdf417AspectRatio));
    }
    if (pdf417Params?.pdf417ECIEncoding != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417ECIEncoding", pdf417Params!.pdf417ECIEncoding));
    }
    if (pdf417Params?.pdf417IsReaderInitialization != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "",
          "pdf417IsReaderInitialization",
          pdf417Params!.pdf417IsReaderInitialization));
    }
    if (pdf417Params?.pdf417MacroCharacters != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417MacroCharacters", pdf417Params!.pdf417MacroCharacters));
    }
    if (pdf417Params?.pdf417IsLinked != null) {
      queryParams.addAll(convertParametersForCollectionFormat(
          "", "pdf417IsLinked", pdf417Params!.pdf417IsLinked));
    }
    if (pdf417Params?.pdf417IsCode128Emulation != null) {
      queryParams.addAll(convertParametersForCollectionFormat("",
          "pdf417IsCode128Emulation", pdf417Params!.pdf417IsCode128Emulation));
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
      BarcodeImageParams? barcodeImageParams,
      QrParams? qrParams,
      Code128Params? code128Params,
      Pdf417Params? pdf417Params}) async {
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
    if (barcodeImageParams?.imageFormat != null) {
      mp.fields['imageFormat'] = [
        parameterToString(barcodeImageParams!.imageFormat)
      ];
    }
    if (barcodeImageParams?.textLocation != null) {
      mp.fields['textLocation'] = [
        parameterToString(barcodeImageParams!.textLocation)
      ];
    }
    if (barcodeImageParams?.foregroundColor != null) {
      mp.fields['foregroundColor'] = [
        parameterToString(barcodeImageParams!.foregroundColor)
      ];
    }
    if (barcodeImageParams?.backgroundColor != null) {
      mp.fields['backgroundColor'] = [
        parameterToString(barcodeImageParams!.backgroundColor)
      ];
    }
    if (barcodeImageParams?.units != null) {
      mp.fields['units'] = [parameterToString(barcodeImageParams!.units)];
    }
    if (barcodeImageParams?.resolution != null) {
      mp.fields['resolution'] = [
        parameterToString(barcodeImageParams!.resolution)
      ];
    }
    if (barcodeImageParams?.imageHeight != null) {
      mp.fields['imageHeight'] = [
        parameterToString(barcodeImageParams!.imageHeight)
      ];
    }
    if (barcodeImageParams?.imageWidth != null) {
      mp.fields['imageWidth'] = [
        parameterToString(barcodeImageParams!.imageWidth)
      ];
    }
    if (barcodeImageParams?.rotationAngle != null) {
      mp.fields['rotationAngle'] = [
        parameterToString(barcodeImageParams!.rotationAngle)
      ];
    }
    if (qrParams?.qrEncodeMode != null) {
      mp.fields['qrEncodeMode'] = [parameterToString(qrParams!.qrEncodeMode)];
    }
    if (qrParams?.qrErrorLevel != null) {
      mp.fields['qrErrorLevel'] = [parameterToString(qrParams!.qrErrorLevel)];
    }
    if (qrParams?.qrVersion != null) {
      mp.fields['qrVersion'] = [parameterToString(qrParams!.qrVersion)];
    }
    if (qrParams?.qrECIEncoding != null) {
      mp.fields['qrECIEncoding'] = [parameterToString(qrParams!.qrECIEncoding)];
    }
    if (qrParams?.qrAspectRatio != null) {
      mp.fields['qrAspectRatio'] = [parameterToString(qrParams!.qrAspectRatio)];
    }
    if (qrParams?.microQRVersion != null) {
      mp.fields['microQRVersion'] = [
        parameterToString(qrParams!.microQRVersion)
      ];
    }
    if (qrParams?.rectMicroQrVersion != null) {
      mp.fields['rectMicroQrVersion'] = [
        parameterToString(qrParams!.rectMicroQrVersion)
      ];
    }
    if (code128Params?.code128EncodeMode != null) {
      mp.fields['code128EncodeMode'] = [
        parameterToString(code128Params!.code128EncodeMode)
      ];
    }
    if (pdf417Params?.pdf417EncodeMode != null) {
      mp.fields['pdf417EncodeMode'] = [
        parameterToString(pdf417Params!.pdf417EncodeMode)
      ];
    }
    if (pdf417Params?.pdf417ErrorLevel != null) {
      mp.fields['pdf417ErrorLevel'] = [
        parameterToString(pdf417Params!.pdf417ErrorLevel)
      ];
    }
    if (pdf417Params?.pdf417Truncate != null) {
      mp.fields['pdf417Truncate'] = [
        parameterToString(pdf417Params!.pdf417Truncate)
      ];
    }
    if (pdf417Params?.pdf417Columns != null) {
      mp.fields['pdf417Columns'] = [
        parameterToString(pdf417Params!.pdf417Columns)
      ];
    }
    if (pdf417Params?.pdf417Rows != null) {
      mp.fields['pdf417Rows'] = [parameterToString(pdf417Params!.pdf417Rows)];
    }
    if (pdf417Params?.pdf417AspectRatio != null) {
      mp.fields['pdf417AspectRatio'] = [
        parameterToString(pdf417Params!.pdf417AspectRatio)
      ];
    }
    if (pdf417Params?.pdf417ECIEncoding != null) {
      mp.fields['pdf417ECIEncoding'] = [
        parameterToString(pdf417Params!.pdf417ECIEncoding)
      ];
    }
    if (pdf417Params?.pdf417IsReaderInitialization != null) {
      mp.fields['pdf417IsReaderInitialization'] = [
        parameterToString(pdf417Params!.pdf417IsReaderInitialization)
      ];
    }
    if (pdf417Params?.pdf417MacroCharacters != null) {
      mp.fields['pdf417MacroCharacters'] = [
        parameterToString(pdf417Params!.pdf417MacroCharacters)
      ];
    }
    if (pdf417Params?.pdf417IsLinked != null) {
      mp.fields['pdf417IsLinked'] = [
        parameterToString(pdf417Params!.pdf417IsLinked)
      ];
    }
    if (pdf417Params?.pdf417IsCode128Emulation != null) {
      mp.fields['pdf417IsCode128Emulation'] = [
        parameterToString(pdf417Params!.pdf417IsCode128Emulation)
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
