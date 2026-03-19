// ignore_for_file: library_prefixes, constant_identifier_names

import 'dart:convert' show json;

import 'package:http/http.dart' as Http show Client, Response;

import 'http/multipart_request_plus.dart';
import '../aspose_barcode_cloud.dart';
import 'api_helper.dart';
import 'auth/authentication.dart';

/// Current SDK Version
const SDK_VERSION = "4.26.3";

/// ApiClient is responsible for making HTTP requests to the API.
class ApiClient {
  late final String _basePath;
  final _httpClient = Http.Client();

  /// SDK header name
  static const String API_SDK_HEADER = "x-aspose-client";

  /// SDK name
  static const String SDK_NAME = "dart sdk";

  /// Aspose client version header name
  static const String API_CLIENT_VERSION_HEADER = "x-aspose-client-version";

  final Map<String, String> _defaultHeaderMap = {
    API_SDK_HEADER: SDK_NAME,
    API_CLIENT_VERSION_HEADER: SDK_VERSION,
  };

  late Authentication _authentication;

  final _regList = RegExp(r'^List<(.*)>$');
  final _regMap = RegExp(r'^Map<String,(.*)>$');

  /// Constructor
  ApiClient(Configuration config) {
    _basePath = config.basePath;
    _authentication = OAuth(
        clientId: config.clientId,
        clientSecret: config.clientSecret,
        accessToken: config.accessToken,
        tokenUrl: config.tokenUrl);
  }

  /// Add default header value by key
  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'ApiError':
          return ApiError.fromJson(value);
        case 'ApiErrorResponse':
          return ApiErrorResponse.fromJson(value);
        case 'BarcodeImageFormat':
          return BarcodeImageFormat.fromJson(value);
        case 'BarcodeImageParams':
          return BarcodeImageParams.fromJson(value);
        case 'BarcodeResponse':
          return BarcodeResponse.fromJson(value);
        case 'BarcodeResponseList':
          return BarcodeResponseList.fromJson(value);
        case 'CodeLocation':
          return CodeLocation.fromJson(value);
        case 'DecodeBarcodeType':
          return DecodeBarcodeType.fromJson(value);
        case 'EncodeBarcodeType':
          return EncodeBarcodeType.fromJson(value);
        case 'EncodeData':
          return EncodeData.fromJson(value);
        case 'EncodeDataType':
          return EncodeDataType.fromJson(value);
        case 'GenerateParams':
          return GenerateParams.fromJson(value);
        case 'GraphicsUnit':
          return GraphicsUnit.fromJson(value);
        case 'RecognitionImageKind':
          return RecognitionImageKind.fromJson(value);
        case 'RecognitionMode':
          return RecognitionMode.fromJson(value);
        case 'RecognizeBase64Request':
          return RecognizeBase64Request.fromJson(value);
        case 'RegionPoint':
          return RegionPoint.fromJson(value);
        case 'ScanBase64Request':
          return ScanBase64Request.fromJson(value);
        default:
          {
            RegExpMatch? match;
            if (value is List &&
                (match = _regList.firstMatch(targetType)) != null) {
              final newTargetType = match![1];
              return value.map((v) => _deserialize(v, newTargetType!)).toList();
            } else if (value is Map &&
                (match = _regMap.firstMatch(targetType)) != null) {
              final newTargetType = match![1];
              return Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType!)));
            }
          }
      }
    } on Exception catch (e, stack) {
      throw ApiException.withInner(
          0, 'Exception during deserialization.', e, stack);
    }
    throw ApiException(
        0, 'Could not find a suitable class for deserialization');
  }

  /// Deserialize the response into the target type.
  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') {
      return jsonVal;
    }

    final decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  /// Serialize the object into a JSON string.
  String serialize(Object? obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  /// Invoke HTTP request
  /// We don't use a `Map<String, String>` for queryParams.
  /// If collectionFormat is 'multi' a key might appear multiple times.
  Future<Http.Response> invokeAPI(
      String path,
      String method,
      List<QueryParam> queryParams,
      Object? body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames) async {
    await _updateParamsForAuth(queryParams, headerParams);

    final ps = queryParams.map((p) => '${p.name}=${p.value}');
    final String queryString = ps.isNotEmpty ? '?${ps.join('&')}' : '';

    final String url = _basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if (body is MultipartRequestPlus) {
      final request = MultipartRequestPlus(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      final response = await _httpClient.send(request);
      return Http.Response.fromStream(response);
    } else {
      final msgBody = contentType == "application/x-www-form-urlencoded"
          ? formParams
          : serialize(body);
      switch (method) {
        case "POST":
          return _httpClient.post(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case "PUT":
          return _httpClient.put(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case "DELETE":
          return _httpClient.delete(Uri.parse(url), headers: headerParams);
        case "PATCH":
          return _httpClient.patch(Uri.parse(url),
              headers: headerParams, body: msgBody);
        default:
          return _httpClient.get(Uri.parse(url), headers: headerParams);
      }
    }
  }

  Future<void> _updateParamsForAuth(
      List<QueryParam> queryParams, Map<String, String> headerParams) async {
    await _authentication.applyToParams(queryParams, headerParams);
  }
}
