import 'dart:ui';
import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  final Widget? child;
  const CustomBackgroundImage({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Theme.of(context).primaryColorDark, Theme.of(context).primaryColor, Theme.of(context).primaryColorLight],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black45,
          child: child,
        ),
      ),
    );
  }
}
