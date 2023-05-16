import 'package:get/get.dart';

class DataController extends GetxController {
//! Helper function //////////////////////////////////////////////////////////
  // Error handler
  // return ReturnType class where value is T and isValid = true if ErrorType.done
  Future<ReturnType<T>> _errorHandler<T>({bool showError = true, required Function function}) async {
    isRequesting.value = true;
    dynamic value;
    ErrorType errorType = await ErrorHandler.errorHandler(function: () async => value = await function(), showError: showError);
    if (errorType == ErrorType.invalidUser) _loadLoginScreen(goLoginPage: showError);
    isRequesting.value = false;
    return ReturnType<T>(value: value, isValid: errorType == ErrorType.done ? true : false);
  }
}
