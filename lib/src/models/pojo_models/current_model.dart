import 'package:weather_app/src/models/pojo_models/condition_model.dart';

class CurrentModel {
  double lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  double tempF;
  double isDay;
  ConditionModel condition;
  double windMph;
  double windKph;
  double windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  double humidity;
  double cloud;
  double feelslikeC;
  double feelslikeF;
  double visKm;
  double visMiles;
  double uv;
  double gustMph;
  double gustKph;

  CurrentModel({
    this.lastUpdatedEpoch = -1,
    this.lastUpdated = "",
    this.tempC = -1,
    this.tempF = -1,
    this.isDay = 1,
    ConditionModel? condition,
    this.windMph = -1,
    this.windKph = -1,
    this.windDegree = -1,
    this.windDir = "",
    this.pressureMb = -1,
    this.pressureIn = -1,
    this.precipMm = -1,
    this.precipIn = -1,
    this.humidity = -1,
    this.cloud = -1,
    this.feelslikeC = -1,
    this.feelslikeF = -1,
    this.visKm = -1,
    this.visMiles = -1,
    this.uv = -1,
    this.gustMph = -1,
    this.gustKph = -1,
  }) : condition = condition ?? ConditionModel();

  // double.tryParse(
  // .toString()) ?? -1

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    CurrentModel res = CurrentModel();
    if (json['last_updated_epoch'] != null) res.lastUpdatedEpoch = double.tryParse(json['last_updated_epoch'].toString()) ?? -1;
    if (json['last_updated'] != null) res.lastUpdated = json['last_updated'];
    if (json['temp_c'] != null) res.tempC = double.tryParse(json['temp_c'].toString()) ?? -1;
    if (json['temp_f'] != null) res.tempF = double.tryParse(json['temp_f'].toString()) ?? -1;
    if (json['is_day'] != null) res.isDay = double.tryParse(json['is_day'].toString()) ?? -1;
    if (json['condition'] != null) res.condition = ConditionModel.fromJson(json['condition']);
    if (json['wind_mph'] != null) res.windMph = double.tryParse(json['wind_mph'].toString()) ?? -1;
    if (json['wind_kph'] != null) res.windKph = double.tryParse(json['wind_kph'].toString()) ?? -1;
    if (json['wind_degree'] != null) res.windDegree = double.tryParse(json['wind_degree'].toString()) ?? -1;
    if (json['wind_dir'] != null) res.windDir = json['wind_dir'].toString();
    if (json['pressure_mb'] != null) res.pressureMb = double.tryParse(json['pressure_mb'].toString()) ?? -1;
    if (json['pressure_in'] != null) res.pressureIn = double.tryParse(json['pressure_in'].toString()) ?? -1;
    if (json['precip_mm'] != null) res.precipMm = double.tryParse(json['precip_mm'].toString()) ?? -1;
    if (json['precip_in'] != null) res.precipIn = double.tryParse(json['precip_in'].toString()) ?? -1;
    if (json['humidity'] != null) res.humidity = double.tryParse(json['humidity'].toString()) ?? -1;
    if (json['cloud'] != null) res.cloud = double.tryParse(json['cloud'].toString()) ?? -1;
    if (json['feelslike_c'] != null) res.feelslikeC = double.tryParse(json['feelslike_c'].toString()) ?? -1;
    if (json['feelslike_f'] != null) res.feelslikeF = double.tryParse(json['feelslike_f'].toString()) ?? -1;
    if (json['vis_km'] != null) res.visKm = double.tryParse(json['vis_km'].toString()) ?? -1;
    if (json['vis_miles'] != null) res.visMiles = double.tryParse(json['vis_miles'].toString()) ?? -1;
    if (json['uv'] != null) res.uv = double.tryParse(json['uv'].toString()) ?? -1;
    if (json['gust_mph'] != null) res.gustMph = double.tryParse(json['gust_mph'].toString()) ?? -1;
    if (json['gust_kph'] != null) res.gustKph = double.tryParse(json['gust_kph'].toString()) ?? -1;

    return res;
  }
}
