import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/utils/app_toast.dart';
import '../../../shared/data_sources/remote/api/api_endpoint_url.dart';
import '../../../shared/services/weather_service.dart';
import '../model/weather_model.dart';

class WeatherController extends GetxController {
  WeatherController(this._weatherService);
  final WeatherService _weatherService;

  final RxBool loading = false.obs;
  final Rxn<WeatherModel> weatherModel = Rxn();
  final TextEditingController cityController = TextEditingController();

  //debounce
  Timer? debounceTimer;

  @override
  void onInit() {
    getWeather();
    super.onInit();
  }

  Future<void> getWeather() async {
    loading(true);
    final params = {
      'q': cityController.text.trim().isEmpty
          ? 'Dhaka'
          : cityController.text.trim(),
      'appid': ApiEndpointUrl.apiKey
    };
    final result = await _weatherService.getWeatherData(params: params);
    if (result != null) {
      weatherModel.value = result;
    }
    loading(false);
  }

  void searchOnTap() {
    if (cityController.text.isEmpty) {
      showToast('Field can\'t be empty');
      return;
    }
    getWeather();
  }

  void clearSearch() {
    cityController.clear();
    getWeather();
  }

  void debouncing({required Function() fn, int waitForMs = 800}) {
    debounceTimer?.cancel();
    debounceTimer = Timer(Duration(milliseconds: waitForMs), fn);
  }
}
