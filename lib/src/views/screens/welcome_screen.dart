import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app_constants.dart';
import 'package:weather_app/src/views/screens/home_screen.dart';
import 'package:weather_app/src/views/widgets/custom_background_image.dart';
import 'package:weather_app/src/views/widgets/custom_loading_bar.dart';
import 'package:weather_app/src/views/widgets/custom_page_title.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Go to main screen
    Future.delayed(const Duration(seconds: defaultSplashScreenTime)).then((_) => Get.offAll(() => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title

                      const CustomPageTitle(title: "Weather App"),
                      const SizedBox(height: defaultPadding / 2),
                      // Subtitle
                      Text(api, style: defaultSubtitle1.copyWith(color: Theme.of(context).canvasColor), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: defaultPadding * 2,
                child: Align(
                  alignment: Alignment.center,
                  child: CustomCircularProgressBar(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
