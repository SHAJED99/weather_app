import 'package:weather_app/src/models/pojo_models/condition_model.dart';

class DayModel {
  double maxtempC;
  double maxtempF;
  double mintempC;
  double mintempF;
  double avgtempC;
  double avgtempF;
  double maxwindMph;
  double maxwindKph;
  double totalprecipMm;
  double totalprecipIn;
  double totalsnowCm;
  double avgvisKm;
  double avgvisMiles;
  double avghumidity;
  double dailyWillItRain;
  double dailyChanceOfRain;
  double dailyWillItSnow;
  double dailyChanceOfSnow;
  ConditionModel condition;
  double uv;

  DayModel({
    this.maxtempC = -1,
    this.maxtempF = -1,
    this.mintempC = -1,
    this.mintempF = -1,
    this.avgtempC = -1,
    this.avgtempF = -1,
    this.maxwindMph = -1,
    this.maxwindKph = -1,
    this.totalprecipMm = -1,
    this.totalprecipIn = -1,
    this.totalsnowCm = -1,
    this.avgvisKm = -1,
    this.avgvisMiles = -1,
    this.avghumidity = -1,
    this.dailyWillItRain = -1,
    this.dailyChanceOfRain = -1,
    this.dailyWillItSnow = -1,
    this.dailyChanceOfSnow = -1,
    ConditionModel? condition,
    this.uv = -1,
  }) : condition = condition ?? ConditionModel();

  factory DayModel.fromJson(Map<String, dynamic> json) {
    DayModel res = DayModel();
    if (json['maxtemp_c'] != null) res.maxtempC = double.tryParse(json['maxtemp_c'].toString()) ?? -1;
    if (json['maxtemp_f'] != null) res.maxtempF = double.tryParse(json['maxtemp_f'].toString()) ?? -1;
    if (json['mintemp_c'] != null) res.mintempC = double.tryParse(json['mintemp_c'].toString()) ?? -1;
    if (json['mintemp_f'] != null) res.mintempF = double.tryParse(json['mintemp_f'].toString()) ?? -1;
    if (json['avgtemp_c'] != null) res.avgtempC = double.tryParse(json['avgtemp_c'].toString()) ?? -1;
    if (json['avgtemp_f'] != null) res.avgtempF = double.tryParse(json['avgtemp_f'].toString()) ?? -1;
    if (json['maxwind_mph'] != null) res.maxwindMph = double.tryParse(json['maxwind_mph'].toString()) ?? -1;
    if (json['maxwind_kph'] != null) res.maxwindKph = double.tryParse(json['maxwind_kph'].toString()) ?? -1;
    if (json['totalprecip_mm'] != null) res.totalprecipMm = double.tryParse(json['totalprecip_mm'].toString()) ?? -1;
    if (json['totalprecip_in'] != null) res.totalprecipIn = double.tryParse(json['totalprecip_in'].toString()) ?? -1;
    if (json['totalsnow_cm'] != null) res.totalsnowCm = double.tryParse(json['totalsnow_cm'].toString()) ?? -1;
    if (json['avgvis_km'] != null) res.avgvisKm = double.tryParse(json['avgvis_km'].toString()) ?? -1;
    if (json['avgvis_miles'] != null) res.avgvisMiles = double.tryParse(json['avgvis_miles'].toString()) ?? -1;
    if (json['avghumidity'] != null) res.avghumidity = double.tryParse(json['avghumidity'].toString()) ?? -1;
    if (json['daily_will_it_rain'] != null) res.dailyWillItRain = double.tryParse(json['daily_will_it_rain'].toString()) ?? -1;
    if (json['daily_chance_of_rain'] != null) res.dailyChanceOfRain = double.tryParse(json['daily_chance_of_rain'].toString()) ?? -1;
    if (json['daily_will_it_snow'] != null) res.dailyWillItSnow = double.tryParse(json['daily_will_it_snow'].toString()) ?? -1;
    if (json['daily_chance_of_snow'] != null) res.dailyChanceOfSnow = double.tryParse(json['daily_chance_of_snow'].toString()) ?? -1;
    if (json['condition'] != null) res.condition = ConditionModel.fromJson(json['condition']);
    if (json['uv'] != null) res.uv = double.tryParse(json['uv'].toString()) ?? -1;
    return res;
  }
}
