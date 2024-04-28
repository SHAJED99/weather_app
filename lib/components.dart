import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//! ------------------------------------------------------------------------------------------------ Company Information
const baseCompanyName = "Steadfast IT";
const projectName = "Weather App";

const urlTOS = "";
const urlPP = "";

//! ------------------------------------------------------------------------------------------------ Sizes
get baseScreenSize => const Size(360, 690);
get defaultPadding => 24.sp;
get defaultBoxHeight => defaultPadding * 2;
const maxBoxWidth = 400.0;
get carouselHeight => 300.sp;
const Curve defaultCurve = Curves.easeInOut;

//* Border
get borderWidth1 => 1.sp;
get borderWidth2 => 2.sp;

//! ------------------------------------------------------------------------------------------------ Time
const defaultSplashScreenShow = Duration(seconds: 3);
const defaultDuration = Duration(milliseconds: 500);

//! ------------------------------------------------------------------------------------------------ Color
const primaryColor = Color(0xff378CE7);
List<BoxShadow> get defaultShadow => [
      BoxShadow(
        offset: Offset(2.sp, 2.sp),
        blurRadius: 1.sp,
        spreadRadius: 1.sp,
        color: Colors.black38,
      ),
    ];

//! ------------------------------------------------------------------------------------------------ Text
TextTheme get textTheme => GoogleFonts.poppinsTextTheme(Typography.englishLike2018.apply(fontSizeFactor: 1.sp));

get buttonTheme => ButtonThemeData(height: defaultBoxHeight);

AppBarTheme _appBarTheme({Brightness brightness = Brightness.light}) {
  return AppBarTheme(
    toolbarHeight: defaultBoxHeight,
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
    titleTextStyle: textTheme.titleLarge?.copyWith(color: brightness == Brightness.light ? Colors.black : Colors.white),
  );
}

//! ------------------------------------------------------------------------------------------------ Theme
ThemeData theme({Brightness brightness = Brightness.light}) {
  return ThemeData(
    useMaterial3: true,
    textTheme: textTheme,
    buttonTheme: buttonTheme,
    appBarTheme: _appBarTheme(brightness: brightness),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: brightness),
  );
}

SystemUiOverlayStyle setSafeAreaColor(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    );
  } else {
    return SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    );
  }
}
