class ConditionModel {
  String text;
  String icon;
  int code;

  ConditionModel({this.text = "", this.icon = "", this.code = -1});

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'] ?? "",
      icon: json['icon'] ?? "",
      code: json['code'] ?? -1,
    );
  }
}
