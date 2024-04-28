import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/controllers/services/api/http_call.dart';

class ApiServices extends GetxController {
  late final HttpCall _httpCall;
  ApiServices() : _httpCall = HttpCall();
}
