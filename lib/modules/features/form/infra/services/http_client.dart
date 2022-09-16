import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_client_interface.dart';

class HttpPackageClient implements IHttpClient {
  @override
  Future get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
