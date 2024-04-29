import 'package:weather_app/src/models/pojo_models/condition_model.dart';

class HourModel {
  int timeEpoch;
  String time;
  double tempC;
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
  double precipIn;
  int snowCm;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  int willItRain;
  int chanceOfRain;
  int willItSnow;
  int chanceOfSnow;
  int visKm;
  int visMiles;
  double gustMph;
  double gustKph;
  int uv;

  HourModel({
    this.timeEpoch = -1,
    this.time = "",
    this.tempC = -1,
    this.tempF = -1,
    this.isDay = -1,
    ConditionModel? condition,
    this.windMph = -1,
    this.windKph = -1,
    this.windDegree = -1,
    this.windDir = "",
    this.pressureMb = -1,
    this.pressureIn = -1,
    this.precipMm = -1,
    this.precipIn = -1,
    this.snowCm = -1,
    this.humidity = -1,
    this.cloud = -1,
    this.feelslikeC = -1,
    this.feelslikeF = -1,
    this.windchillC = -1,
    this.windchillF = -1,
    this.heatindexC = -1,
    this.heatindexF = -1,
    this.dewpointC = -1,
    this.dewpointF = -1,
    this.willItRain = -1,
    this.chanceOfRain = -1,
    this.willItSnow = -1,
    this.chanceOfSnow = -1,
    this.visKm = -1,
    this.visMiles = -1,
    this.gustMph = -1,
    this.gustKph = -1,
    this.uv = -1,
  }) : condition = condition ?? ConditionModel();

  factory HourModel.fromJson(Map<String, dynamic> json) {
    HourModel res = HourModel();
    res.timeEpoch = json['time_epoch'] ?? -1;
    res.time = json['time'] ?? "";
    res.tempC = double.tryParse(json['temp_c'].toString()) ?? -1;
    res.tempF = double.tryParse(json['temp_f'].toString()) ?? -1;
    res.isDay = json['is_day'] ?? -1;
    res.condition = json['condition'] != null ? ConditionModel.fromJson(json['condition']) : ConditionModel();
    res.windMph = double.tryParse(json['wind_mph'].toString()) ?? -1;
    res.windKph = double.tryParse(json['wind_kph'].toString()) ?? -1;
    res.windDegree = json['wind_degree'] ?? -1;
    res.windDir = json['wind_dir'] ?? "";
    res.pressureMb = json['pressure_mb'] ?? -1;
    res.pressureIn = double.tryParse(json['pressure_in'].toString()) ?? -1;
    res.precipMm = double.tryParse(json['precip_mm'].toString()) ?? -1;
    res.precipIn = double.tryParse(json['precip_in'].toString()) ?? -1;
    res.snowCm = json['snow_cm'] ?? -1;
    res.humidity = json['humidity'] ?? -1;
    res.cloud = json['cloud'] ?? -1;
    res.feelslikeC = double.tryParse(json['feelslike_c'].toString()) ?? -1;
    res.feelslikeF = double.tryParse(json['feelslike_f'].toString()) ?? -1;
    res.windchillC = double.tryParse(json['windchill_c'].toString()) ?? -1;
    res.windchillF = double.tryParse(json['windchill_f'].toString()) ?? -1;
    res.heatindexC = double.tryParse(json['heatindex_c'].toString()) ?? -1;
    res.heatindexF = double.tryParse(json['heatindex_f'].toString()) ?? -1;
    res.dewpointC = double.tryParse(json['dewpoint_c'].toString()) ?? -1;
    res.dewpointF = double.tryParse(json['dewpoint_f'].toString()) ?? -1;
    res.willItRain = json['will_it_rain'] ?? -1;
    res.chanceOfRain = json['chance_of_rain'] ?? -1;
    res.willItSnow = json['will_it_snow'] ?? -1;
    res.chanceOfSnow = json['chance_of_snow'] ?? -1;
    res.visKm = json['vis_km'] ?? -1;
    res.visMiles = json['vis_miles'] ?? -1;
    res.gustMph = double.tryParse(json['gust_mph'].toString()) ?? -1;
    res.gustKph = double.tryParse(json['gust_kph'].toString()) ?? -1;
    res.uv = json['uv'] ?? -1;
    return res;
  }
}
