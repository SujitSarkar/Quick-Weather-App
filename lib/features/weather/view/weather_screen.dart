import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../features/weather/view/widgets/sunrise_sunset_widget.dart';
import '../../../features/weather/view/widgets/weather_details.dart';
import '../../../shared/widgets/text_widget.dart';
import '../../../shared/widgets/widget_imports.dart';
import '../../../core/constants/app_color.dart';
import '../../../shared/widgets/search_field.dart';
import '../../../features/weather/controller/weather_controller.dart';
import 'widgets/temperature_details.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const SearchField(),
          actions: [
            IconButton(
                onPressed: () => controller.searchOnTap(),
                icon: const Icon(
                  CupertinoIcons.search,
                  color: AppColors.lightSecondaryTextColor,
                ))
          ],
        ),
        body: Obx(
          () => controller.loading.value
              ? const LoadingWidget()
              : _bodyUI(controller),
        ));
  }

  Widget _bodyUI(WeatherController controller) =>
      controller.weatherModel.value == null
          ? NoDataFound(
              onRefresh: () => controller.getWeather(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Weather image
                  Center(child: SvgPicture.asset(Assets.assetsWeather)),

                  //Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleText(
                          text:
                              '${controller.weatherModel.value?.name ?? 'Not Found'} ',
                          textsize: 30.sp),
                      const Icon(
                        Icons.near_me,
                        color: AppColors.lightTextColor,
                        size: 28,
                      )
                    ],
                  ),

                  //Temperature
                  TemperatureDetails(weather: controller.weatherModel.value!)
                      .paddingOnly(bottom: 40),

                  //Weather details
                  WeatherDetails(weather: controller.weatherModel.value!)
                      .paddingOnly(bottom: 40),
                  SunriseSunsetWidget(weather: controller.weatherModel.value!)
                ],
              ),
            );
}
