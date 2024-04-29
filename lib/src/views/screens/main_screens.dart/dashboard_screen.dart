import 'package:flutter/material.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_scaffold.dart';
import 'package:weather_app/src/views/widgets/background.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      child: CustomBackground(),
    );
  }
}
