import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:weather_app/components.dart';
import 'package:weather_app/src/controllers/screen_controllers/splash_screen_controller.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_scaffold.dart';
import 'package:weather_app/src/views/widgets/background.dart';
import 'package:weather_app/src/views/widgets/loading_bar.dart';
import 'package:weather_app/src/views/widgets/text.dart';

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
      child: CustomBackground(
        child: SafeArea(
          child: Stack(
            children: [
              const _Icon(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _Version(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //! Animation
          Container(
            margin: EdgeInsets.all(defaultPadding),
            constraints: BoxConstraints(maxWidth: defaultBoxHeight * 6),
            child: const RiveAnimation.asset("lib/assets/animation/starting.riv", useArtboardSize: true),
          ),

          //! Project Name
          const CustomTextTitle.L(text: projectName, isBold: true),
        ],
      ),
    );
  }
}

class _Version extends StatelessWidget {
  _Version();
  final SplashScreenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        children: [
          const CustomCircularProgressBar(),
          SizedBox(height: defaultPadding / 2),
          //! Version
          Obx(() => CustomTextTitle.S(text: "Version: ${_controller.version}"))
        ],
      ),
    );
  }
}
