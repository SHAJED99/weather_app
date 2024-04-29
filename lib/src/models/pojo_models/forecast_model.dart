import 'package:weather_app/src/controllers/services/functions/map_converter.dart';
import 'package:weather_app/src/models/pojo_models/forecast_day_model.dart';

class ForecastModel {
  List<ForecastdayModel> forecastday;

  ForecastModel({this.forecastday = const []});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    List<ForecastdayModel> res = [];
    res = json.customToMapList("forecastday").map<ForecastdayModel>((e) => ForecastdayModel.fromJson(e)).toList();
    return ForecastModel(forecastday: res);
  }
}
