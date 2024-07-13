import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../model/weather_model.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final weatherCondition = weather.weather?.first.main?.toLowerCase();
    return weatherCondition == 'rain'
        ? SvgPicture.asset(Assets.assetsRain)
        : weatherCondition == 'clouds'
            ? SvgPicture.asset(Assets.assetsClouds)
            : weatherCondition == 'clear'
                ? SvgPicture.asset(Assets.assetsClear)
                : SvgPicture.asset(Assets.assetsWeather);
  }
}
