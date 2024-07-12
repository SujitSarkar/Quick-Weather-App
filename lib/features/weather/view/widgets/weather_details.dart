import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/text_widget.dart';
import '../../../../shared/widgets/card_widget.dart';
import '../../../../shared/data_sources/remote/api/api_endpoint_url.dart';
import '../../../../shared/widgets/image_placeholder.dart';
import '../../model/weather_model.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Weather condition
          Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${ApiEndpointUrl.weatherIconUrl}${weather.weather?.first.icon}.png",
                height: 36,
                width: 36,
                fit: BoxFit.cover,
                placeholder: (context, url) => const ImagePlaceholder(),
                errorWidget: (context, url, error) => const ImagePlaceholder(),
              ),
              BodyText(
                text: '${weather.weather?.first.main}',
                fontWeight: FontWeight.bold,
              )
            ],
          ),

          // Feels like
          Column(
            children: [
              const BodyText(
                text: 'Feels like',
                textColor: AppColors.lightSecondaryTextColor,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 16),
              BodyText(
                text:
                    '${kelvinToCelcius(tempInKelvin: weather.main?.feelsLike ?? 0.0)}°',
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          // Feels like
          Column(
            children: [
              const BodyText(
                text: 'Humidity',
                textColor: AppColors.lightSecondaryTextColor,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 16),
              BodyText(
                text: '${weather.main?.humidity}%',
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ),
    );
  }
}
