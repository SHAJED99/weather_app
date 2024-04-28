import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/models/app_models/local_data_model.dart';

class LocalDataHandler extends GetxController {
  LocalDataModel localDataModel = LocalDataModel();
  late final GetStorage box;
  final String _localDataString = "data";

  Future<void> initApp() async {
    await GetStorage.init();
    box = GetStorage();
    var r = box.read(_localDataString);
    try {
      if (r != null) localDataModel = LocalDataModel.fromJson(r);
    } catch (e) {
      box.erase();
      devPrint("error: $e");
    }

    _print(localDataModel.toString());

    localDataModel.appSetting.listen((_) {
      devPrint("AppSetting Data is Changed. Writing local data.");
      _print(localDataModel.appSetting.value.toString());
      box.write(_localDataString, localDataModel.toJson());
    });
  }

  setData(String key, dynamic data) {
    try {
      box.write(key, jsonEncode(data));
    } catch (e) {
      devPrint("LocalDataHandler: Unable to write date for: $key --------- Error: $e");
    }
  }

  T? readData<T>(String key) {
    try {
      return jsonDecode(box.read<String>(key)!) as T;
    } catch (e) {
      devPrint("LocalDataHandler: Unable to write date for: $key --------- Error: $e");
      return null;
    }
  }
}

_print(String text) {
  devPrint("""
LocalDataHandler ------------------------------------------------------------
$text
----------------------------------------------------------------------------------------------------
""");
}
