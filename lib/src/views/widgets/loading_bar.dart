import 'package:flutter/material.dart';
import 'package:weather_app/components.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({super.key, this.color, this.size, this.value});
  final Color? color;
  final double? size;
  final double? value;

  @override
  Widget build(BuildContext context) {
    double s = size ?? defaultPadding;
    return SizedBox(
        width: s,
        height: s,
        child: FittedBox(
          child: CircularProgressIndicator(
            color: color ?? Theme.of(context).colorScheme.onPrimary,
            value: value == null ? null : value! / 100,
          ),
        ));
  }
}

// LinearProgressIndicator

class CustomLinearProgressBar extends StatelessWidget {
  const CustomLinearProgressBar({super.key, this.color, this.size, this.show = true, this.value}) : _opacity = 0.1;
  final Color? color;
  final double? size;
  final bool show;
  final double? value;

  const CustomLinearProgressBar.small({super.key, this.color, this.size = 2, this.show = true, this.value}) : _opacity = 1;

  final double _opacity;

  @override
  Widget build(BuildContext context) {
    double s = size ?? defaultPadding;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(s / 2)),
      height: s,
      child: show
          ? LinearProgressIndicator(
              value: value == null ? null : value! / 100,
              backgroundColor: Colors.transparent,
              color: color ?? Theme.of(context).colorScheme.onPrimary.withOpacity(_opacity),
            )
          : null,
    );
  }
}
