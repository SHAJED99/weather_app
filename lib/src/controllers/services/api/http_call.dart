import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/components.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/controllers/services/user_message/snackbar.dart';

class HttpCall {
  final Map<String, String> _header = {
    "Content-Type": "application/json",
    "Accept": "/",
  };

  //! Get
  //! Here isGetting = true, when api is getting date. False, when sending data. null when offline mode is not applicable
  Future<http.Response> get(String url, {String? customBaseLink}) async {
    if (kDebugMode) showToast(title: null, message: url);

    final Map<String, String> header = {};

    header.addAll(_header); // adding head

    String sendLink = "${customBaseLink ?? baseLink}$url&key=$apiKey";
    devPrint("HttpCall: Requesting: Get------------------------------------------------------------- $sendLink");

    http.Response res = await http.get(Uri.parse(sendLink), headers: header).timeout(apiCallTimeOut);
    devPrint("HttpCall: Response: GET ------------------------------------------------------------ $sendLink $_header --- Status Code: ${res.statusCode} --- Data: ${res.body}");

    return res;
  }

  //! Post
  //! Here isGetting = true, when api is getting date. False, when sending data. null when offline mode is not applicable
  Future<http.Response> post(String url, {Object? body, String? customBaseLink, bool doEncode = true}) async {
    if (kDebugMode) showToast(title: null, message: url);

    final Map<String, String> header = {};

    header.addAll(_header); // adding head

    String sendLink = "${customBaseLink ?? baseLink}$url&key=$apiKey";
    devPrint("HttpCall: Requesting: POST ------------------------------------------------------------ $sendLink - Body: ${jsonEncode(body)}");

    http.Response res = await http.post(Uri.parse(sendLink), headers: header, body: doEncode ? jsonEncode(body) : body).timeout(apiCallTimeOut);
    devPrint("HttpCall: Response: POST ------------------------------------------------------------ $sendLink --- Status Code: ${res.statusCode} --- Data: ${res.body}");

    return res;
  }
}
