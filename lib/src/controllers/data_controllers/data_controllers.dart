import 'package:get/get.dart';
import 'package:weather_app/src/controllers/services/api/api_services.dart';
import 'package:weather_app/src/controllers/services/handle_error/app_exceptions.dart';
import 'package:weather_app/src/controllers/services/handle_error/error_handler.dart';
import 'package:weather_app/src/models/pojo_classes/response_model.dart';
import 'package:weather_app/src/models/return_type.dart';
import 'package:geolocator/geolocator.dart';

class DataController extends GetxController {
  RxBool isRequesting = false.obs;
  RxBool isLocationPermission = false.obs;
  RxMap<String, double> location = RxMap();
  Rx<ApiResponse?> response = Rxn();
  Rx<DateTime?> timeNow = Rxn();

  //! Helper function //////////////////////////////////////////////////////////
  // Error handler
  // return ReturnType class where value is T and isValid = true if ErrorType.done
  Future<ReturnType<T>> _errorHandler<T>({bool showError = true, required Function function}) async {
    isRequesting.value = true;
    dynamic value;
    ErrorType errorType = await ErrorHandler.errorHandler(function: () async => value = await function(), showError: showError);
    isRequesting.value = false;
    return ReturnType<T>(value: value, isValid: errorType == ErrorType.done ? true : false);
  }
  //! //////////////////////////////////////////////////////////////////////////

  // Asking user location permission
  Future<void> _permissionStatusUpdate() async {
    var p = await Geolocator.checkPermission();
    if (p == LocationPermission.whileInUse || p == LocationPermission.always) {
      isLocationPermission.value = true;
    } else {
      isLocationPermission.value = false;
      throw UnablePermission();
    }
  }

  Future<void> getWeather() async {
    if (isRequesting.value) return;
    await _errorHandler(function: () async {
      if (!isLocationPermission.value) await _permissionStatusUpdate();
      if (!isLocationPermission.value) return;
      Position loc = await Geolocator.getCurrentPosition();
      response.value = await ApiServices.getWeather(loc.latitude.toString(), loc.longitude.toString());
      timeNow.value = DateTime.now();
    });
  }
}
