import 'dart:convert';
import 'package:get/get.dart';
import 'package:weather_app/src/models/app_models/app_setting_model.dart';

//! ------------------------------------------------------------------------------------------------ B1
class LocalDataModel {
  final Rx<AppSettingModel> appSetting;

  //! ----------------------------------------------------------------------------------------------
  LocalDataModel({
    AppSettingModel? appSetting,
  }) : appSetting = Rx(appSetting ?? AppSettingModel());

  //! ----------------------------------------------------------------------------------------------
  LocalDataModel copyWith({AppSettingModel? appSetting}) {
    return LocalDataModel(appSetting: appSetting ?? this.appSetting.value);
  }

  //! ----------------------------------------------------------------------------------------------
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appSetting': appSetting.value.toMap(),
    };
  }

  //! ----------------------------------------------------------------------------------------------
  factory LocalDataModel.fromMap(Map<String, dynamic> map) {
    return LocalDataModel(appSetting: AppSettingModel.fromMap(map['appSetting'] as Map<String, dynamic>));
  }

  String toJson() => json.encode(toMap());

  factory LocalDataModel.fromJson(String source) => LocalDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  //! ----------------------------------------------------------------------------------------------
  @override
  String toString() => '''
LocalDataModel(
  appSetting: ${appSetting.value.toString()},
)
''';
}
