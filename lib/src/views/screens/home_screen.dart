import 'package:flutter/material.dart';
import 'package:weather_app/app_constants.dart';
import 'package:weather_app/src/views/widgets/custom_background_image.dart';
import 'package:weather_app/src/views/widgets/custom_page_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Weather App"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
          return RefreshIndicator(
            onRefresh: () async {
              Future.delayed(const Duration(seconds: 2));
            },
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: boxConstraints.maxHeight + 0.1),
                padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
                child: const Column(
                  children: [
                    CustomPageTitle(title: "Current Weather"),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
