import 'dart:convert';

import 'package:cardapio_digital_mobile/src/repository/token_repository.dart';
import 'package:http/http.dart';

class MyHttpService {
  final Client client = Client();
  final String baseUrl = "http://192.168.15.94:3000";
  final TokenRepository _tokenRepository = TokenRepository();
  Map<String, String> headers = {};

  static MyHttpService instance = MyHttpService();

  Future<void> updateHeaders() async {
    headers = {
      'Content-Type': 'application/json',
    };
    String? token = await _tokenRepository.getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Response> get(
      {required String uri, Map<String, dynamic>? queryParams}) async {
    Uri url = Uri.parse(baseUrl + uri);
    await updateHeaders();
    if (queryParams != null) {
      url.replace(queryParameters: queryParams);
    }

    var response = client.get(url, headers: headers);
    return response;
  }

  Future<Response> post(
      {required String uri, Map<String, dynamic>? body}) async {
    Uri url = Uri.parse(baseUrl + uri);
    await updateHeaders();

    var response = client.post(url,
        headers: headers, body: (body != null) ? json.encode(body) : null);
    return response;
  }

  Future<Response> patch(
      {required String uri, Map<String, dynamic>? body}) async {
    Uri url = Uri.parse(baseUrl + uri);
    await updateHeaders();

    var response = client.patch(url,
        headers: headers, body: (body != null) ? json.encode(body) : null);
    return response;
  }
}
