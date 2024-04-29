import 'package:flutter/material.dart';

extension ThemeManipulation on ThemeData {
  Gradient get customGetBackgroundGradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colorScheme.primaryContainer,
        colorScheme.primary,
      ],
    );
  }
}
