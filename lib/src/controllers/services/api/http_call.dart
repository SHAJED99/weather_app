import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpCall {
  static const String _baseLink = "https://api.openweathermap.org/";
  static const String _apiKey = "9df58b66bc4085731d5bbfcd006dc926";
  static const Duration _timeout = Duration(seconds: 10);
  static const Map<String, String> _header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static Future<http.Response> get(String url, {String token = ''}) async {
    final Map<String, String> header = {};
    header.addAll(_header);
    if (token.isNotEmpty) header.addAll({"token": token});

    if (kDebugMode) print("Requesting:------------------------------------------ Url: $_baseLink$url&units=metric&appid=$_apiKey");

    return await http.get(Uri.parse("$_baseLink$url&units=metric&appid=$_apiKey"), headers: header).timeout(_timeout);
  }
}
