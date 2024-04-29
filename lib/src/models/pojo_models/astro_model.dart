class AstroModel {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  double moonIllumination;
  double isMoonUp;
  double isSunUp;

  AstroModel({
    this.sunrise = "",
    this.sunset = "",
    this.moonrise = "",
    this.moonset = "",
    this.moonPhase = "",
    this.moonIllumination = -1,
    this.isMoonUp = -1,
    this.isSunUp = -1,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) {
    AstroModel res = AstroModel();
    res.sunrise = json['sunrise'] ?? "";
    res.sunset = json['sunset'] ?? "";
    res.moonrise = json['moonrise'] ?? "";
    res.moonset = json['moonset'] ?? "";
    res.moonPhase = json['moon_phase'] ?? "";
    res.moonIllumination = double.tryParse(json['moon_illumination'].toString()) ?? -1;
    res.isMoonUp = double.tryParse(json['is_moon_up'].toString()) ?? -1;
    res.isSunUp = double.tryParse(json['is_sun_up'].toString()) ?? -1;
    return res;
  }
}
