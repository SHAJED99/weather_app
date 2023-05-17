import 'package:flutter/material.dart';
import 'package:weather_app/app_constants.dart';
import 'package:weather_app/src/controllers/services/user_message/snackbar.dart';

abstract class AppExceptions implements Exception {
  final String prefix;
  final String message;

  AppExceptions({this.prefix = "", this.message = ""}) {
    showSnackBar(
      title: prefix,
      message: message,
      icon: const Icon(Icons.error, color: defaultErrorColor),
    );
  }
}

// 1
class InternetException extends AppExceptions {
  InternetException({String? message}) : super(prefix: "Error", message: "No Internet Connection. ${message ?? ""}");
}

// 2
class RequestTimeOut extends AppExceptions {
  RequestTimeOut({String? message}) : super(prefix: "Error", message: "Request timeout. ${message ?? ""}");
}

// 3
class InternalError extends AppExceptions {
  InternalError({String? message}) : super(prefix: "Error", message: "There is an error while processing the request. ${message ?? ""}");
}

// 4
class ServiceUnavailable extends AppExceptions {
  ServiceUnavailable({String? message}) : super(prefix: "Error", message: "The server is temporarily busy, try again later! ${message ?? ""}");
}

// 5
class InvalidUser extends AppExceptions {
  InvalidUser({String? message}) : super(prefix: "Error", message: "Invalid user. ${message ?? ""}");
}

class UnablePermission extends AppExceptions {
  UnablePermission({String? message}) : super(prefix: "Error", message: "Permission denied. Please give permission. ${message ?? ""}");
}
