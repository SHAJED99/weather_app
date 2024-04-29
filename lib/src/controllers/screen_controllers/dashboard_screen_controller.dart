import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/controllers/data_controllers/data_controller.dart';
import 'package:weather_app/src/controllers/services/functions/get_permission.dart';
import 'package:weather_app/src/controllers/services/user_message/snackbar.dart';
import 'package:weather_app/src/models/response_models/weather_forecast_response_model.dart';

class DashboardScreenController extends GetxController {
  final DataController _controller = Get.find();

  RxBool isLoading = false.obs;
  RxBool gettingLocation = false.obs;
  double? latitude;
  double? longitude;
  RxString locationString = "".obs;
  Rx<WeatherForecastResponseModel?> response = Rxn();

  @override
  onInit() {
    super.onInit();
    gettingWeather();
  }

  Future<void> gettingWeather() async {
    await getLocation();
    await getWeatherForecast();
  }

  Future<bool?> getLocation() async {
    if (gettingLocation.value) return null;

    locationString.value = "";

    if (!await askPermission(Permission.location)) {
      locationString.value = "No permission";
      return false;
    }

    if (!await Geolocator.isLocationServiceEnabled()) {
      locationString.value = "Location service not enable";
      showToast(message: "Location service not enable");
      return false;
    }

    gettingLocation.value = true;

    // Getting location
    Position currentLocation = await Geolocator.getCurrentPosition();

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;

    locationString.value = "Latitude: $latitude\nLongitude: $longitude";

    gettingLocation.value = false;
    return null;
  }

  Future<void> getWeatherForecast() async {
    if (isLoading.value) return;
    if (latitude == null || longitude == null) return;

    isLoading.value = true;
    response.value = await _controller.getWeatherForecast(latitude!.toString(), longitude!.toString());
    isLoading.value = false;
  }
}
