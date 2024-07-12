import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_weather_app/shared/utils/utils.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../shared/widgets/text_widget.dart';
import '../../model/weather_model.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Weather condition
            Column(
              children: [
                const BodyText(
                  text: 'Time',
                  textColor: AppColors.lightSecondaryTextColor,
                  fontWeight: FontWeight.bold,
                ).paddingOnly(bottom: 8),
                BodyText(
                  text: DateFormat('hh:mm aa').format(DateTime.now()),
                  fontWeight: FontWeight.bold,
                )
              ],
            ),

            const SizedBox(height: 30, child: VerticalDivider(thickness: 0.5)),

            // Feels like
            Column(
              children: [
                const BodyText(
                  text: 'Sunrise',
                  textColor: AppColors.lightSecondaryTextColor,
                  fontWeight: FontWeight.bold,
                ).paddingOnly(bottom: 8),
                BodyText(
                  text: DateFormat('hh:mm aa').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          weather.sys!.sunrise! * 1000)),
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            const SizedBox(height: 30, child: VerticalDivider(thickness: 0.5)),
            // Feels like
            Column(
              children: [
                const BodyText(
                  text: 'Sunset',
                  textColor: AppColors.lightSecondaryTextColor,
                  fontWeight: FontWeight.bold,
                ).paddingOnly(bottom: 8),
                BodyText(
                  text: DateFormat('hh:mm aa').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          weather.sys!.sunset! * 1000)),
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ],
        ).paddingOnly(bottom: 16),
        Row(
          children: [
            const BodyText(
              text: 'Length of the day: ',
              textColor: AppColors.lightSecondaryTextColor,
            ),
            BodyText(
              text: getTimeInHourMinute(
                  weather.sys!.sunrise! * 1000, weather.sys!.sunset! * 1000),
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ],
    );
  }
}
