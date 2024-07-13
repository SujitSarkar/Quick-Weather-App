import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../shared/widgets/text_widget.dart';
import '../../model/weather_model.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleText(text: '${weather.name ?? 'Not found'} ', textsize: 30.sp),
        const Icon(
          Icons.location_on_outlined,
          color: AppColors.lightTextColor,
          size: 28,
        )
      ],
    );
  }
}
