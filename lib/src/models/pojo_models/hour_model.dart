import 'package:weather_app/src/models/pojo_models/condition_model.dart';

class HourModel {
  double timeEpoch;
  String time;
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
  double snowCm;
  double humidity;
  double cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  double willItRain;
  double chanceOfRain;
  double willItSnow;
  double chanceOfSnow;
  double visKm;
  double visMiles;
  double gustMph;
  double gustKph;
  double uv;

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
    res.timeEpoch = double.tryParse(json['time_epoch'].toString()) ?? -1;
    res.time = json['time'] ?? "";
    res.tempC = double.tryParse(json['temp_c'].toString()) ?? -1;
    res.tempF = double.tryParse(json['temp_f'].toString()) ?? -1;
    res.isDay = double.tryParse(json['is_day'].toString()) ?? -1;
    res.condition = json['condition'] != null ? ConditionModel.fromJson(json['condition']) : ConditionModel();
    res.windMph = double.tryParse(json['wind_mph'].toString()) ?? -1;
    res.windKph = double.tryParse(json['wind_kph'].toString()) ?? -1;
    res.windDegree = double.tryParse(json['wind_degree'].toString()) ?? -1;
    res.windDir = json['wind_dir'] ?? "";
    res.pressureMb = double.tryParse(json['pressure_mb'].toString()) ?? -1;
    res.pressureIn = double.tryParse(json['pressure_in'].toString()) ?? -1;
    res.precipMm = double.tryParse(json['precip_mm'].toString()) ?? -1;
    res.precipIn = double.tryParse(json['precip_in'].toString()) ?? -1;
    res.snowCm = double.tryParse(json['snow_cm'].toString()) ?? -1;
    res.humidity = double.tryParse(json['humidity'].toString()) ?? -1;
    res.cloud = double.tryParse(json['cloud'].toString()) ?? -1;
    res.feelslikeC = double.tryParse(json['feelslike_c'].toString()) ?? -1;
    res.feelslikeF = double.tryParse(json['feelslike_f'].toString()) ?? -1;
    res.windchillC = double.tryParse(json['windchill_c'].toString()) ?? -1;
    res.windchillF = double.tryParse(json['windchill_f'].toString()) ?? -1;
    res.heatindexC = double.tryParse(json['heatindex_c'].toString()) ?? -1;
    res.heatindexF = double.tryParse(json['heatindex_f'].toString()) ?? -1;
    res.dewpointC = double.tryParse(json['dewpoint_c'].toString()) ?? -1;
    res.dewpointF = double.tryParse(json['dewpoint_f'].toString()) ?? -1;
    res.willItRain = double.tryParse(json['will_it_rain'].toString()) ?? -1;
    res.chanceOfRain = double.tryParse(json['chance_of_rain'].toString()) ?? -1;
    res.willItSnow = double.tryParse(json['will_it_snow'].toString()) ?? -1;
    res.chanceOfSnow = double.tryParse(json['chance_of_snow'].toString()) ?? -1;
    res.visKm = double.tryParse(json['vis_km'].toString()) ?? -1;
    res.visMiles = double.tryParse(json['vis_miles'].toString()) ?? -1;
    res.gustMph = double.tryParse(json['gust_mph'].toString()) ?? -1;
    res.gustKph = double.tryParse(json['gust_kph'].toString()) ?? -1;
    res.uv = double.tryParse(json['uv'].toString()) ?? -1;
    return res;
  }
}
