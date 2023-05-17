import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/controllers/services/api/http_call.dart';
import 'package:weather_app/src/models/pojo_classes/response_model.dart';

class ApiServices {
  static Future<ApiResponse> getWeather(String lat, String lon) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.productListSlider()");
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    String httpLink = "data/2.5/weather?lat=$lat&lon=$lon";
    try {
      http.Response res = await HttpCall.get(httpLink);
      if (res.statusCode != 200) throw res.statusCode;
      var json = ApiResponse.fromJson(jsonDecode(res.body));
      return json;
    } catch (e) {
      rethrow;
    }
  }
}
