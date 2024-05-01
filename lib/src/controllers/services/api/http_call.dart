import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/components.dart';
import 'package:weather_app/src/controllers/local_data_controller/local_data_handler.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/controllers/services/functions/response_conversion.dart';
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

    // http.Response res = await http.get(Uri.parse(sendLink), headers: header).timeout(apiCallTimeOut);
    http.Response res = await _onCallFunction(
      link: sendLink.split("q=").first,
      function: () async => await http.get(Uri.parse(sendLink), headers: header).timeout(apiCallTimeOut),
    );

    devPrint("HttpCall: Response: GET ------------------------------------------------------------ $sendLink $_header --- Status Code: ${res.statusCode} --- Data: ${res.body}");

    return res;
  }

  bool showOfflineToast = true;
  Future<http.Response> _onCallFunction({
    required String link,
    Object? body,
    required Future<http.Response> Function() function,
    // required bool? isGetting,
  }) async {
    final LocalDataHandler localData = Get.find();

    String setUrl = "";

    setUrl = "${setUrl}_${link.hashCode}_${body == null ? "" : body.hashCode}";

    try {
      http.Response res = await function();
      showOfflineToast = true;

      try {
        localData.box.write(setUrl, json.encode(res.customToJson));
        devPrint("HttpCall__onCallFunction: Saving Data to $link");
      } catch (e) {
        devPrint("HttpCall__onCallFunction: Unable to write data for $link. Error: $e");
      }
      return res;
    } on SocketException {
      // if (isGetting != true) rethrow;

      try {
        devPrint("HttpCall__onCallFunction: Reading Data from $link");
        //! Checking if I have local data
        String? temp = localData.box.read<String>(setUrl);
        if (temp == null) rethrow;

        Map<String, dynamic> mapTemp = json.decode(temp);
        http.Response res = mapTemp.customToHttpResponse;

        if (showOfflineToast) showToast(message: "Offline mode");
        showOfflineToast = false;
        return res;
      } catch (e) {
        devPrint("HttpCall__onCallFunction: Unable to read data for $link. Error $e");
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
