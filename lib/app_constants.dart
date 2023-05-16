// Colors
import 'package:flutter/material.dart';

const MaterialColor defaultPrimarySwatch = MaterialColor(
  0xFF5130A7,
  <int, Color>{
    50: Color(0xFFF2E7FE),
    100: Color(0xFFD8B6FD),
    200: Color(0xFFC185FB),
    300: Color(0xFFA854F9),
    400: Color(0xFF8F23F8),
    500: Color(0xFF5130A7),
    600: Color(0xFF4007F5),
    700: Color(0xFF3A06D1),
    800: Color(0xFF3405AD),
    900: Color(0xFF2D0489),
  },
);
const Color defaultBlackColor = Color(0xFF505050);
// const Color defaultBlackColor = Color.fromARGB(30, 182, 231, 232);
const Color defaultWhiteColor = Color(0xFFFAFAFA);
const Color defaultGreyColor = Color(0xFFC0C2C9);
const Color defaultErrorColor = Colors.redAccent;

// time
const int defaultSplashScreenTime = 3;

// Text
const TextStyle defaultTitleStyle1 = TextStyle(
  height: 1,
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: defaultBlackColor,
);
const TextStyle defaultSubtitle1 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: defaultGreyColor,
);
const TextStyle defaultSubtitle2 = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w700,
  color: defaultGreyColor,
  height: 1,
);
const TextStyle buttonText1 = TextStyle(
  fontSize: 16,
  height: 1,
  fontWeight: FontWeight.bold,
  color: defaultWhiteColor,
);

// Box Size
const double defaultPadding = 16;
const double defaultMaxWidth = 400;
const double defaultNavBarHeight = 16 * 3.5;
const double defaultBoxHeight = 16 * 3;
const double defaultCarouselHeight = 16 * 11;

// Box Shadow
const List<BoxShadow> defaultBoxShadowUp = [
  BoxShadow(
    color: defaultGreyColor,
    offset: Offset(0, 0),
    blurRadius: 2,
  )
];
const List<BoxShadow> defaultBoxShadowDown = [
  BoxShadow(
    color: defaultGreyColor,
    offset: Offset(0, 2),
    blurRadius: 1,
  )
];
