import 'package:weather_app/src/models/pojo_models/condition_model.dart';

class CurrentModel {
  int lastUpdatedEpoch;
  String lastUpdated;
  int tempC;
  double tempF;
  int isDay;
  ConditionModel condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  int pressureMb;
  double pressureIn;
  double precipMm;
  int precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  int visKm;
  int visMiles;
  int uv;
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

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    CurrentModel res = CurrentModel();
    if (json['last_updated_epoch'] != null) res.lastUpdatedEpoch = json['last_updated_epoch'];
    if (json['last_updated'] != null) res.lastUpdated = json['last_updated'];
    if (json['temp_c'] != null) res.tempC = json['temp_c'];
    if (json['temp_f'] != null) res.tempF = double.tryParse(json['temp_f'].toString()) ?? -1;
    if (json['is_day'] != null) res.isDay = json['is_day'];
    if (json['condition'] != null) res.condition = ConditionModel.fromJson(json['condition']);
    if (json['wind_mph'] != null) res.windMph = double.tryParse(json['wind_mph'].toString()) ?? -1;
    if (json['wind_kph'] != null) res.windKph = double.tryParse(json['wind_kph'].toString()) ?? -1;
    if (json['wind_degree'] != null) res.windDegree = json['wind_degree'];
    if (json['wind_dir'] != null) res.windDir = json['wind_dir'];
    if (json['pressure_mb'] != null) res.pressureMb = json['pressure_mb'];
    if (json['pressure_in'] != null) res.pressureIn = double.tryParse(json['pressure_in'].toString()) ?? -1;
    if (json['precip_mm'] != null) res.precipMm = double.tryParse(json['precip_mm'].toString()) ?? -1;
    if (json['precip_in'] != null) res.precipIn = json['precip_in'];
    if (json['humidity'] != null) res.humidity = json['humidity'];
    if (json['cloud'] != null) res.cloud = json['cloud'];
    if (json['feelslike_c'] != null) res.feelslikeC = double.tryParse(json['feelslike_c'].toString()) ?? -1;
    if (json['feelslike_f'] != null) res.feelslikeF = double.tryParse(json['feelslike_f'].toString()) ?? -1;
    if (json['vis_km'] != null) res.visKm = json['vis_km'];
    if (json['vis_miles'] != null) res.visMiles = json['vis_miles'];
    if (json['uv'] != null) res.uv = json['uv'];
    if (json['gust_mph'] != null) res.gustMph = double.tryParse(json['gust_mph'].toString()) ?? -1;
    if (json['gust_kph'] != null) res.gustKph = double.tryParse(json['gust_kph'].toString()) ?? -1;

    return res;
  }
}
