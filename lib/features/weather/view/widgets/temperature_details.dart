import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../features/weather/model/weather_model.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/text_widget.dart';

class TemperatureDetails extends StatelessWidget {
  const TemperatureDetails({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TitleText(
              text:
                  '${kelvinToCelcius(tempInKelvin: weather.main?.temp ?? 0.0)}°',
              textsize: 70.sp,
            ),
            const BodyText(text: 'C').paddingOnly(bottom: 16)
          ],
        ),
        BodyText(
            text:
                'Low: ${kelvinToCelcius(tempInKelvin: weather.main?.tempMin ?? 0.0)}° / High: ${kelvinToCelcius(tempInKelvin: weather.main?.tempMax ?? 0.0)}°')
      ],
    );
  }
}
