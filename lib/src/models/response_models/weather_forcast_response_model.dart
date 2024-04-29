import 'package:weather_app/src/models/pojo_models/current_model.dart';
import 'package:weather_app/src/models/pojo_models/forecast_model.dart';
import 'package:weather_app/src/models/pojo_models/location_model.dart';

class WeatherForecastResponseModel {
  LocationModel? location;
  CurrentModel? current;
  ForecastModel? forecast;

  WeatherForecastResponseModel({this.location, this.current, this.forecast});

  WeatherForecastResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['location'] != null) location = LocationModel.fromJson(json['location']);
    if (json['current'] != null) current = CurrentModel.fromJson(json['current']);
    if (json['forecast'] != null) forecast = ForecastModel.fromJson(json['forecast']);
  }
}
