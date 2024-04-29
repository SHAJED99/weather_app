import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/controllers/services/error_handlers/app_exceptions.dart';

class ErrorHandler {
  bool showErrorSnack = true;

  Future<ResponseModel> errorHandler({bool showError = true, required Future Function() function}) async {
    // //!
    // Tuple2<ErrorType, int?> res = await _errorHandler(
    //   showError: showError,
    //   function: () async => await function(),
    // );

    // //! -------------------------------------------------------------------------------------------- Refreshing token
    // if (res.item1 == ErrorType.invalidUser) {
    //   if (showError) InvalidUser();
    // }

    // return ResponseModel(isSuccess: res.item1 == ErrorType.done, statusCode: res.item2 ?? -1);

    // !
    await function();
    return ResponseModel(isSuccess: true, statusCode: 200);
  }

  Future<Tuple2<ErrorType, int?>> _errorHandler({bool showError = true, required Function function}) async {
    try {
      await function();
      showErrorSnack = true;
      return const Tuple2(ErrorType.done, null); // !  --------------------------------------------- Done
    } on SocketException {
      if (kDebugMode) print("ErrorHandler: SocketException");
      if (showError && showErrorSnack) InternetException();
      showErrorSnack = false;
      return const Tuple2(ErrorType.internetException, null); //! ---------------------------------- InternetException
    } on TimeoutException {
      if (kDebugMode) print("ErrorHandler: TimeoutException");
      if (showError && showErrorSnack) RequestTimeOutException();
      showErrorSnack = false;
      return const Tuple2(ErrorType.requestTimeOut, null); //! ------------------------------------- TimeoutException
    } on FormatException {
      if (kDebugMode) print("ErrorHandler: FormatException");
      if (showError && showErrorSnack) FormatException();
      showErrorSnack = false;
      return const Tuple2(ErrorType.requestTimeOut, null); //! ------------------------------------- FormatException
    } catch (e, stackTrace) {
      devPrint(stackTrace);

      if (e is! http.Response) {
        if (kDebugMode) print("ErrorHandler: ${e.toString()}");
        if (showError && showErrorSnack) CustomException();
        showErrorSnack = false;
        return const Tuple2(ErrorType.customException, null); //! ------------------------------------------- CustomException
      }
      if (e.statusCode == 401) {
        if (kDebugMode) print("ErrorHandler: InvalidUser");
        return Tuple2(ErrorType.invalidUser, e.statusCode); //! -------------------------------------- InvalidUser
      }

      if (kDebugMode) print("ErrorHandler: CustomException");

      String message = "";
      try {
        message = jsonDecode(e.body)['error'] ?? "";
      } catch (_) {}

      // if (message.isNotEmpty) message = "Error Message: $message";
      if (showError && showErrorSnack) CustomException(message: message.isEmpty ? "Unexpected error. Please contact the support team." : message, response: "Error code: ${e.statusCode}");
      showErrorSnack = false;
      return Tuple2(ErrorType.customException, e.statusCode); //! ---------------------------------------- CustomException
    }
  }
}

enum ErrorType {
  done,
  internetException,
  requestTimeOut,
  invalidUser,
  customException
}

class ResponseModel {
  final bool isSuccess;
  final int statusCode;

  ResponseModel({required this.isSuccess, this.statusCode = -1});
}
