import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_string.dart';
import '../../../shared/utils/app_toast.dart';
import '../../../shared/services/weather_service.dart';
import '../model/weather_model.dart';

class WeatherController extends GetxController {
  WeatherController(this._weatherService);
  final WeatherService _weatherService;

  final RxBool loading = true.obs;
  final RxBool functionLoading = false.obs;

  final Rxn<WeatherModel> weatherModel = Rxn();
  final TextEditingController cityController = TextEditingController();

  //debounce
  Timer? debounceTimer;

  @override
  void onInit() async {
    await getWeather();
    loading(false);
    super.onInit();
  }

  //Get weather by location. Defauld location is Singapore
  Future<void> getWeather() async {
    final apiKey = dotenv.get('API_KEY');
    final params = {
      'q': cityController.text.trim().isEmpty
          ? 'Singapore'
          : cityController.text.trim(),
      'appid': apiKey
    };

    final result = await _weatherService.getWeatherData(params: params);
    if (result != null) {
      weatherModel.value = result;
    }
  }

  //Search weather
  Future<void> searchOnTap() async {
    if (cityController.text.isEmpty) {
      showToast('Field can\'t be empty');
      return;
    }
    if (functionLoading.value) {
      showToast(AppString.anotherProcessRunning);
      return;
    }
    functionLoading(true);
    await getWeather();
    functionLoading(false);
  }

  //Clear search field
  void clearSearch() {
    cityController.clear();
    update();
  }

  //Reload the weather data
  Future<void> refreshOnTap() async {
    if (loading.value) {
      showToast(AppString.anotherProcessRunning);
      return;
    }
    loading(true);
    await getWeather();
    loading(false);
  }

  void debouncing({required Function() fn, int waitForMs = 800}) {
    debounceTimer?.cancel();
    debounceTimer = Timer(Duration(milliseconds: waitForMs), fn);
  }
}
