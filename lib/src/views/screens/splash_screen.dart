import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/controllers/screen_controllers/splash_screen_controller.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_scaffold.dart';
import 'package:weather_app/src/views/widgets/scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(SplashScreenController());
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<SplashScreenController>();
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      child: CustomScaffold(),
    );
  }
}
