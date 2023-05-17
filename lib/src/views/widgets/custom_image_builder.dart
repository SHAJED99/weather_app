import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "lib/assets/weather_icon/$location.png",
      errorBuilder: (context, error, stackTrace) => Image.asset("lib/assets/weather_icon/unknown.png"),
    );
  }
}
