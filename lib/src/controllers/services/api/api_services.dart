import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/controllers/services/api/http_call.dart';
import 'package:weather_app/src/models/response_models/weather_forecast_response_model.dart';

class ApiServices extends GetxController {
  late final HttpCall _httpCall;
  ApiServices() : _httpCall = HttpCall();

  Future<WeatherForecastResponseModel> getWeatherForecast(String lan, String long) async {
    String httpLink = "forecast.json?q=$lan,$long&days=7";

    http.Response res = await _httpCall.get(httpLink);
    if (res.statusCode != 200) throw res;

    return WeatherForecastResponseModel.fromJson(jsonDecode(res.body));
  }
}
