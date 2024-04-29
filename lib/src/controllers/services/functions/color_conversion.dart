import 'package:flutter/material.dart';

extension ThemeManipulation on ThemeData {
  Gradient get customGetBackgroundGradient {
    List<double> d = [];
    if (brightness == Brightness.light) {
      d = [
        0.1,
        1,
      ];
    } else {
      d = [
        0.1,
        1,
      ];
    }

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.repeated,
      stops: d,
      colors: [
        colorScheme.primaryContainer.withOpacity(0.7),
        colorScheme.primary.withOpacity(0.7),
      ],
    );
  }
}
