import 'package:flutter/material.dart';
import 'package:weather_app/app_constants.dart';
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
    // Future.delayed(const Duration(seconds: defaultSplashScreenTime)).then((value) => Get.offAll(Container()));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                const SizedBox(height: defaultPadding),
                const CustomPageTitle(title: "Weather App"),
                const SizedBox(height: defaultPadding / 2),
                // Subtitle
                Text("This is a dummy app", style: defaultSubtitle1.copyWith(color: Theme.of(context).canvasColor), textAlign: TextAlign.center),
                const SizedBox(height: defaultPadding),
                CustomCircularProgressBar(
                  color: Theme.of(context).canvasColor,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
