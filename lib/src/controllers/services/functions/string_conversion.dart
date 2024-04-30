import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as luncher;
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/controllers/services/user_message/snackbar.dart';

extension StringExtensions on String {
  String customCutString({int starting = 0, int? ending = 100, String replaceString = ""}) => (ending != null && length >= ending) ? "${substring(starting, ending)}$replaceString" : this;

  String get customCapitalizeFirstLetter => isEmpty ? this : "${this[0].toUpperCase()}${substring(1)}";

  double get customStringToDouble {
    double res = 0;

    try {
      res = double.parse(this);
    } catch (_) {}

    return res;
  }

  bool customSearchMatch(String searchValue) {
    bool r = searchValue.trim().replaceAll(" ", "").toLowerCase().contains(trim().replaceAll(" ", "").toLowerCase());
    return r;
  }

  Future<bool> get customCopyToClipboard async {
    try {
      await Clipboard.setData(ClipboardData(text: this));
      showToast(message: "Text copied", title: null);
      return true;
    } catch (e) {
      devPrint("customCopyToClipboard: $e");
      return false;
    }
  }

  Future<bool> get launchUrl async {
    try {
      await luncher.launchUrl(Uri.parse(this));
      showToast(message: "Opening browser");
      return true;
    } catch (_) {
      showToast(message: "Unable to launch");
      return false;
    }
  }
}
