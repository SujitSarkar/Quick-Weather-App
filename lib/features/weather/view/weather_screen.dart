import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/weather/view/widgets/sunrise_sunset_widget.dart';
import '../../../features/weather/view/widgets/weather_details.dart';
import '../../../shared/widgets/widget_imports.dart';
import '../../../core/constants/app_color.dart';
import '../../../shared/widgets/search_field.dart';
import '../../../features/weather/controller/weather_controller.dart';
import 'widgets/location_widget.dart';
import 'widgets/temperature_details.dart';
import 'widgets/weather_icon_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: const SearchField().paddingOnly(right: 12)),
              Obx(
                () => GestureDetector(
                  onTap: () => controller.searchOnTap(),
                  child: controller.functionLoading.value
                      ? const LoadingWidget()
                      : Icon(
                          CupertinoIcons.search,
                          size: 28.sp,
                          color: AppColors.lightSecondaryTextColor,
                        ),
                ),
              )
            ],
          ),
        ),
        body: Obx(
          () => controller.loading.value
              ? const Center(child: LoadingWidget())
              : _bodyUI(controller),
        ));
  }

  Widget _bodyUI(WeatherController controller) =>
      controller.weatherModel.value == null
          ? NoDataFound(onRefresh: () => controller.refreshOnTap())
          : RefreshIndicator(
              backgroundColor: AppColors.lightBgColor,
              onRefresh: () async => await controller.getWeather(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Weather condition image
                    Center(
                            child: WeatherIconWidget(
                                weather: controller.weatherModel.value!))
                        .paddingOnly(bottom: 12),

                    //Location
                    LocationWidget(weather: controller.weatherModel.value!),

                    //Temperature
                    TemperatureDetails(weather: controller.weatherModel.value!)
                        .paddingOnly(bottom: 40),

                    //Weather details
                    WeatherDetails(weather: controller.weatherModel.value!)
                        .paddingOnly(bottom: 40),
                    SunriseSunsetWidget(weather: controller.weatherModel.value!)
                  ],
                ),
              ),
            );
}
