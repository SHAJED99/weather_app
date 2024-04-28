import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/components.dart';
import 'package:weather_app/src/controllers/data_controllers/data_controller.dart';
import 'package:weather_app/src/views/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      fontSizeResolver: (fontSize, instance) => fontSize.toDouble(),
      ensureScreenSize: true,
      designSize: baseScreenSize,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        theme: theme(),
        darkTheme: theme(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        initialBinding: InitializedBinding(),
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        home: child!,
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: setSafeAreaColor(context),
            child: child!,
          );
        },
      ),
      child: const SplashScreen(),
    );
  }
}

class InitializedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController());
  }
}
