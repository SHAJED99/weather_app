import 'package:get/get.dart';
import 'package:weather_app/src/controllers/services/handle_error/error_handler.dart';
import 'package:weather_app/src/models/return_type.dart';

class DataController extends GetxController {
  RxBool isRequesting = false.obs;

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
}
