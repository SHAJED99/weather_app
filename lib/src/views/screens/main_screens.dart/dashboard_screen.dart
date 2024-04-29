import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/controllers/screen_controllers/dashboard_screen_controller.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_scaffold.dart';
import 'package:weather_app/src/views/widgets/background.dart';
import 'package:weather_app/src/views/widgets/text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(DashboardScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      child: CustomBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _StatusShow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusShow extends StatelessWidget {
  _StatusShow();

  final DashboardScreenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.gettingLocation.value) {
        return Lottie.asset(
          "lib/assets/animation/searching_location.json",
          reverse: true,
        );
      }

      if (_controller.isLoading.value) {}
      return const SizedBox();
    });
  }
}
