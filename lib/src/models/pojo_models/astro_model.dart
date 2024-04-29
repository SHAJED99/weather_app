class AstroModel {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  int moonIllumination;
  int isMoonUp;
  int isSunUp;

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
    res.moonIllumination = json['moon_illumination'] ?? -1;
    res.isMoonUp = json['is_moon_up'] ?? -1;
    res.isSunUp = json['is_sun_up'] ?? -1;
    return res;
  }
}
