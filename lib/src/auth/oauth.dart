import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' show Client, MultipartRequest;

import '../api_exception.dart';
import '../api_helper.dart';
import 'authentication.dart';

/// OAuth 2.0 authentication
class OAuth implements Authentication {
  /// Client Id from https://dashboard.aspose.cloud/applications
  final String? clientId;

  /// Client Secret from https://dashboard.aspose.cloud/applications
  final String? clientSecret;

  /// URL to get the token
  final String tokenUrl;

  /// Access token value
  String? accessToken;

  /// Token expiration date
  DateTime? tokenExpiration;

  /// HTTP client for token requests. When `null`, each token request uses
  /// its own short-lived client. `ApiClient` passes its own client, so
  /// closing the `ApiClient` also stops its token requests.
  final Client? httpClient;

  /// Constructor
  OAuth(
      {this.clientId,
      this.clientSecret,
      required this.tokenUrl,
      this.accessToken,
      this.httpClient}) {
    if (!((clientId != null && clientSecret != null) || accessToken != null)) {
      throw ApiException(
          0, "clientId and clientSecret or accessToken required");
    }
  }

  @override
  Future<void> applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) async {
    if (accessToken == null && tokenExpiration == null) {
      if (clientId != null && clientSecret != null) {
        accessToken = await fetchToken();
      } else {
        throw ApiException(0, "clientId or clientSecret not defined");
      }
    }

    if (accessToken == null) {
      throw ApiException(0, "accessToken is null");
    }
    headerParams["Authorization"] = "Bearer ${accessToken!}";
  }

  /// Fetches the token from the OAuth server
  Future<String> fetchToken() async {
    final request = MultipartRequest('POST', Uri.parse(tokenUrl))
      ..fields['grant_type'] = 'client_credentials'
      ..fields['client_id'] = clientId!
      ..fields['client_secret'] = clientSecret!;

    final client = httpClient;
    final response =
        client == null ? await request.send() : await client.send(request);
    final responseText = await response.stream.bytesToString();
    if (response.statusCode != 200) {
      throw ApiException(response.statusCode, responseText);
    }

    final data = jsonDecode(responseText);
    final int expiresIn = data['expires_in'];

    tokenExpiration = DateTime.now().add(Duration(seconds: expiresIn));
    return data['access_token'];
  }
}
