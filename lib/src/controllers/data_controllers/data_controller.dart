import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:weather_app/src/controllers/local_data_controller/local_data_handler.dart';
import 'package:weather_app/src/controllers/services/api/api_services.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/controllers/services/error_handlers/error_handler.dart';

class DataController extends GetxController {
  bool _isInit = false;
  final Rx<PackageInfo?> packageInfo = Rxn();
  late final LocalDataHandler localData;
  late final ApiServices _apiServices;
  late final ErrorHandler _errorHandler;

  Future<void> runApp() async {
    if (_isInit) return;
    await _initApp();
    await _startupTask();
    await _addingListeners();
    _isInit = true;
    devPrint("Data Controller has been initialized");
  }

  Future<void> _initApp() async {
    localData = Get.put(LocalDataHandler());
    _apiServices = Get.put(ApiServices());
    _errorHandler = ErrorHandler();
  }

  Future<void> _startupTask() async {
    packageInfo.value = await PackageInfo.fromPlatform();
    await localData.initApp();
    _currentThere();
  }

  Future<void> _addingListeners() async {
    localData.localDataModel.appSetting.listen((_) async => _currentThere());
  }

  void _currentThere() {
    if (localData.localDataModel.appSetting.value.isDarkMode == null) {
      Get.changeThemeMode(ThemeMode.system);
    } else {
      Get.changeThemeMode(localData.localDataModel.appSetting.value.isDarkMode! ? ThemeMode.dark : ThemeMode.light); // Theme change
    }
  }

  void changeTheme({bool? isDarkMode}) => localData.localDataModel.appSetting.value = localData.localDataModel.appSetting.value.copyWith(isDarkMode: isDarkMode);
}
