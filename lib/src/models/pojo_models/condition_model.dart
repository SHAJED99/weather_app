class ConditionModel {
  String text;
  String icon;
  double code;

  ConditionModel({this.text = "", this.icon = "", this.code = -1});

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'] ?? "",
      icon: json['icon'] ?? "",
      code: double.tryParse(json['code'].toString()) ?? -1,
    );
  }
}
