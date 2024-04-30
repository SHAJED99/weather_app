import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_popup_window_widget/on_popup_window_widget.dart';
import 'package:on_process_button_widget/on_process_button_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weather_app/components.dart';
import 'package:weather_app/src/controllers/data_controllers/data_controller.dart';
import 'package:weather_app/src/controllers/screen_controllers/dashboard_screen_controller.dart';
import 'package:weather_app/src/controllers/services/dev_functions/dev_scaffold.dart';
import 'package:weather_app/src/controllers/services/functions/color_conversion.dart';
import 'package:weather_app/src/controllers/services/functions/text_conversion.dart';
import 'package:weather_app/src/controllers/services/functions/time_conversion.dart';
import 'package:weather_app/src/models/pojo_models/current_model.dart';
import 'package:weather_app/src/models/pojo_models/hour_model.dart';
import 'package:weather_app/src/views/widgets/animated_size_widget.dart';
import 'package:weather_app/src/views/widgets/background.dart';
import 'package:weather_app/src/views/widgets/image.dart';
import 'package:weather_app/src/views/widgets/loading_bar.dart';
import 'package:weather_app/src/views/widgets/rounded_button.dart';
import 'package:weather_app/src/views/widgets/size.dart';
import 'package:weather_app/src/views/widgets/svg.dart';
import 'package:weather_app/src/views/widgets/text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardScreenController _controller = Get.put(DashboardScreenController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      child: CustomBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                LayoutBuilder(builder: (context, box) {
                  return RefreshIndicator(
                    onRefresh: () async => await _controller.gettingWeather(),
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(minHeight: box.maxHeight + 0.001),
                        padding: EdgeInsets.symmetric(vertical: defaultPadding * 2),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _StatusShow(),
                            _Location(),
                            _Current(),
                            _DailyDetailsTile(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                //! Change Theme
                Positioned(top: 0, right: 0, child: _ChangeTheme()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChangeTheme extends StatelessWidget {
  _ChangeTheme();
  final DataController _controller = Get.find();

  Widget button(bool? isDark) {
    return OnProcessButtonWidget(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 8),
      onDone: (_) {
        _controller.changeTheme(isDarkMode: isDark);
        Get.back();
      },
      child: Text(isDark == null
          ? "System"
          : isDark
              ? "Dark"
              : "Light"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(right: defaultPadding / 4),
      child: CustomRoundedButton(
        svg: t.brightness == Brightness.light ? "lib/assets/icons/sun.svg" : "lib/assets/icons/moon.svg",
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => OnPopupWindowWidget(
              title: const Text("Change Theme"),
              child: Column(
                children: [
                  button(null), // System
                  button(false), // Light
                  button(true), // Dark
                ],
              ),
            ),
          );

          return;
        },
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
      if (_controller.response.value == null) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAnimatedSize(
                widthFactor: 1,
                child: _controller.gettingLocation.value || _controller.isLoading.value ? Padding(padding: EdgeInsets.all(defaultPadding), child: const CustomCircularProgressBar()) : null,
              ),

              // Status
              CustomTextLabel.L(
                  text: _controller.gettingLocation.value
                      ? "Getting Location"
                      : _controller.isLoading.value
                          ? "Getting Weather Data"
                          : "Something went wrong. Try again."),
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }
}

class _Location extends StatelessWidget {
  _Location();
  final DashboardScreenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final data = _controller.response.value?.location;
        if (data == null) return const SizedBox();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextHeading(text: data.name, isBold: true),
            CustomTextTitle(text: data.country, isBold: true),
            SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSizeBuilder(
                  maxSize: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold).customGetTextSize(context) ?? 0,
                  child: const CustomSVG("lib/assets/icons/location.svg"),
                ),
                SizedBox(width: defaultPadding / 4),
                const Flexible(child: CustomTextLabel(text: "Current Location", isBold: true))
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Current extends StatelessWidget {
  _Current();
  final DashboardScreenController _controller = Get.find();
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final data = _controller.response.value?.current;
      if (data == null) return const SizedBox();

      return GestureDetector(
        onTap: () => isExpanded.value = !isExpanded.value,
        child: Container(
          color: Colors.transparent,
          child: Obx(
            () => CustomAnimatedSize(
              widthFactor: 1,
              alignment: Alignment.topCenter,
              child: isExpanded.value ? _CurrentDetails(data) : _CurrentSummary(data),
            ),
          ),
        ),
      );
    });
  }
}

class _CurrentSummary extends StatelessWidget {
  const _CurrentSummary(this.data);
  final CurrentModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Temperature
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: CustomNetworkImage(data.condition.icon, fit: BoxFit.cover)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: defaultPadding),
                  child: FittedBox(
                    child: CustomTextHeading.L(
                      text: "${data.feelslikeC.toInt().toString()}°",
                      isBold: true,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        //! Details
        CustomTextTitle.L(
          text: "${data.condition.text} - H:${data.humidity}",
          isBold: true,
        ),
      ],
    );
  }
}

class _CurrentDetails extends StatelessWidget {
  const _CurrentDetails(this.data);
  final CurrentModel data;

  Widget setText(BuildContext context, String heading, String value) {
    if (value.isEmpty || value == "-1") return const SizedBox();

    final t = Theme.of(context);
    final tB = t.textTheme.titleMedium?.copyWith(color: t.colorScheme.onBackground);
    final tH = tB?.copyWith(fontWeight: FontWeight.bold);
    return Text.rich(
      TextSpan(
        text: "$heading: ",
        style: tB,
        children: [
          TextSpan(
            text: value,
            style: tH,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          setText(context, "Feels like", "${data.feelslikeC.toString()}° C"),
          setText(context, "Temperature", "${data.tempC.toString()}° C"),
          setText(context, "Wind", "${data.windKph.toString()}° K/h"),
          setText(context, "Humidity", data.humidity.toString()),
        ],
      ),
    );
  }
}

class _DailyDetailsTile extends StatelessWidget {
  _DailyDetailsTile();
  final DashboardScreenController _controller = Get.find();
  final RxInt selectedDate = 0.obs;
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final cT = Theme.of(context).colorScheme;
    return Obx(
      () {
        final data = _controller.response.value?.forecast?.forecastday;
        if (data == null || data.isEmpty) return const SizedBox();

        return Column(
          children: [
            //! Date Selection
            Padding(
              padding: EdgeInsets.all(defaultPadding / 2),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: [
                      for (int i = 0; i < data.length; i++)
                        OnProcessButtonWidget(
                          onDone: (_) {
                            selectedDate.value = i;
                            try {
                              if (itemScrollController.isAttached) {
                                itemScrollController.scrollTo(
                                  curve: defaultCurve,
                                  duration: defaultDuration,
                                  index: !data.elementAt(i).date.customIsSameDay() ? 0 : DateTime.now().hour,
                                );
                              }
                            } catch (_) {}
                          },
                          margin: EdgeInsets.all(defaultPadding / 8),
                          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
                          borderRadius: BorderRadius.circular(100),
                          backgroundColor: (selectedDate.value == i ? cT.primary : cT.background).withOpacity(0.3),
                          fontColor: cT.onBackground,
                          child: Text(data.elementAt(i).date.customIsSameDay() ? "Today" : data.elementAt(i).date.custom_d_MMM_EEE),
                        )
                    ],
                  ),
                ),
              ),
            ),

            //! Hourly Details
            Container(
              height: carouselHeight + (defaultPadding * 2) + (defaultPadding / 4) + (defaultPadding / 2),
              padding: EdgeInsets.all(defaultPadding / 2),
              child: Obx(
                () => ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemScrollController: itemScrollController,
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  itemCount: data.elementAt(selectedDate.value).hour.length,
                  itemBuilder: (context, index) => _HourlyListTile(data.elementAt(selectedDate.value).hour.elementAt(index)),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _HourlyListTile extends StatelessWidget {
  const _HourlyListTile(this.data);
  final HourModel data;

  bool get isNow {
    if (data.time.customIsSameHour()) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Column(
      children: [
        AnimatedContainer(
          duration: defaultDuration,
          height: carouselHeight,
          margin: EdgeInsets.all(defaultPadding / 8),
          padding: EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding / 2),
          decoration: BoxDecoration(
            gradient: t.customGetBackgroundGradient,
            borderRadius: BorderRadius.circular(10000),
            boxShadow: defaultShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextTitle.S(text: isNow ? "Now" : data.time.custom_hh_a, isBold: true),
              CustomNetworkImage(data.condition.icon),
              CustomTextTitle.S(text: "${data.tempC.toString()}° C", isBold: true),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: defaultPadding / 4),
          height: defaultPadding,
          width: defaultPadding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isNow ? t.colorScheme.onBackground : Colors.transparent,
          ),
        )
      ],
    );
  }
}
