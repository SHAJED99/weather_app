import 'package:flutter/material.dart';
import 'package:weather_app/src/controllers/services/functions/color_conversion.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Container(
      decoration: BoxDecoration(gradient: t.customGetBackgroundGradient),
      child: child,
    );
  }
}
