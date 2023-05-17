import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app_constants.dart';
import 'package:weather_app/src/controllers/data_controllers/data_controllers.dart';
import 'package:weather_app/src/views/widgets/custom_background_image.dart';
import 'package:weather_app/src/views/widgets/custom_image_builder.dart';
import 'package:weather_app/src/views/widgets/custom_loading_bar.dart';
import 'package:weather_app/src/views/widgets/custom_page_title.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController dataController = Get.find();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await dataController.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
          return RefreshIndicator(
            onRefresh: () async {
              await getData();
            },
            child: Obx(
              () => SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(minHeight: boxConstraints.maxHeight + 0.1, minWidth: boxConstraints.maxWidth),
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // If Loading
                      if (dataController.response.value == null && dataController.isRequesting.value)
                        CustomCircularProgressBar(
                          color: Theme.of(context).canvasColor,
                        ),
                      // If data found
                      if (dataController.response.value != null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Location
                            Text(
                              "${dataController.response.value?.name ?? ""}, ${dataController.response.value?.sys?.country ?? ""}",
                              style: defaultTitleStyle1.copyWith(color: Theme.of(context).canvasColor),
                            ),
                            const SizedBox(height: defaultPadding),
                            // Time
                            Text(
                              "Updated: ${DateFormat("yyyy-MM-dd HH:mm").format(dataController.timeNow.value ?? DateTime.now())}",
                              style: defaultSubtitle1,
                            ),
                            const SizedBox(height: defaultPadding * 2),
                            // Weather Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image
                                SizedBox(
                                  height: defaultBoxHeight,
                                  width: defaultBoxHeight,
                                  child: WeatherImage(location: "${dataController.response.value?.weather?[0].description}"),
                                ),
                                const SizedBox(width: defaultPadding),
                                // Temp
                                Text(
                                  "${dataController.response.value?.main?.feelsLike}°",
                                  style: defaultWeatherText,
                                ),
                                const SizedBox(width: defaultPadding),
                                // Min max temp
                                Column(
                                  children: [
                                    Text("max: ${dataController.response.value?.main?.tempMax}°", style: defaultSubtitle1),
                                    Text("max: ${dataController.response.value?.main?.tempMin}°", style: defaultSubtitle1),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding * 2),
                            // Status
                            CustomPageTitle(title: (dataController.response.value?.weather?[0].description ?? "").capitalizeFirst ?? ""),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
