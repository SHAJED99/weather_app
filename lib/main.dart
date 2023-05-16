import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app_constants.dart';
import 'package:weather_app/src/controllers/data_controllers/data_controllers.dart';
import 'package:weather_app/src/views/screens/welcome_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      initialBinding: InitializedBinding(),
      theme: ThemeData(
        primarySwatch: defaultPrimarySwatch,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: defaultPrimarySwatch).copyWith(
          error: defaultErrorColor,
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      home: WelcomeScreen(),
    );
  }
}

class InitializedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController());
  }
}
