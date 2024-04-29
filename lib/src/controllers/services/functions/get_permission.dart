//! ---------------------------------------------------------------------------------------------- All permission handling will be here
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_print.dart';
import 'package:weather_app/src/controllers/services/user_message/snackbar.dart';

Future<bool> askPermission(Permission permission) async {
  bool res = false;

  try {
    res = await permission.request() == PermissionStatus.granted;
  } catch (e) {
    devPrint("AskPermission: ${permission.value}: Error: $e");
  }

  if (!res) showToast(message: "Denied");
  return res;
}
