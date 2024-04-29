class LocationModel {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  double localtimeEpoch;
  String localtime;

  LocationModel({this.name = "", this.region = "", this.country = "", this.lat = -1, this.lon = -1, this.tzId = "", this.localtimeEpoch = -1, this.localtime = ""});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    LocationModel res = LocationModel();
    if (json['name'] != null) res.name = json['name'];
    if (json['region'] != null) res.region = json['region'];
    if (json['country'] != null) res.country = json['country'];
    if (json['lat'] != null) res.lat = double.tryParse(json['lat'].toString()) ?? -1;
    if (json['lon'] != null) res.lon = double.tryParse(json['lon'].toString()) ?? -1;
    if (json['tz_id'] != null) res.tzId = json['tz_id'];
    if (json['localtime_epoch'] != null) res.localtimeEpoch = double.tryParse(json['localtime_epoch'].toString()) ?? -1;
    if (json['localtime'] != null) res.localtime = json['localtime'];

    return res;
  }
}
