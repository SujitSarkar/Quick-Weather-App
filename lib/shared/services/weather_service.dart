import 'dart:convert';
import 'package:flutter/material.dart';
import '../../features/weather/model/weather_model.dart';
import '../data_sources/remote/api/api_endpoint_url.dart';
import '../data_sources/remote/api/api_exception.dart';
import '../data_sources/remote/api/remote_imports.dart';
import '../utils/app_toast.dart';

class WeatherService extends ApiClient {
  Future<WeatherModel?> getWeatherData(
      {required Map<String, dynamic> params}) async {
    try {
      final response = await getRequest(
          path: ApiEndpointUrl.baseUrl, queryParameters: params);
      return weatherModelFromJson(jsonEncode(response.data));
    } on ApiException catch (error) {
      showToast(error.message ?? 'Unknown error');
      debugPrint(error.message ?? 'Unknown error');
    } catch (error) {
      showToast(error.toString());
      debugPrint(error.toString());
    }
    return null;
  }
}
