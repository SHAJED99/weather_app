import 'package:weather_app/src/controllers/services/functions/map_converter.dart';
import 'package:weather_app/src/models/pojo_models/astro_model.dart';
import 'package:weather_app/src/models/pojo_models/day_model.dart';
import 'package:weather_app/src/models/pojo_models/hour_model.dart';

class ForecastdayModel {
  String date;
  double dateEpoch;
  DayModel day;
  AstroModel astro;
  List<HourModel> hour;

  ForecastdayModel({
    this.date = "",
    this.dateEpoch = -1,
    DayModel? day,
    AstroModel? astro,
    this.hour = const [],
  })  : day = day ?? DayModel(),
        astro = astro ?? AstroModel();

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) {
    ForecastdayModel res = ForecastdayModel();
    if (json['date'] != null) res.date = json['date'];
    if (json['date_epoch'] != null) res.dateEpoch = double.tryParse(json['date_epoch'].toString()) ?? -1;
    if (json['day'] != null) res.day = DayModel.fromJson(json['day']);
    if (json['astro'] != null) res.astro = AstroModel.fromJson(json['astro']);
    res.hour = json.customToMapList("hour").map((e) => HourModel.fromJson(e)).toList();

    return res;
  }
}
