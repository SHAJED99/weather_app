import 'package:flutter/material.dart';

extension TextManipulation on TextStyle {
  double customGetTextSize(BuildContext context) => MediaQuery.textScalerOf(context).scale(fontSize ?? 0);
}
