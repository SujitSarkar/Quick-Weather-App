part of 'router_imports.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() => WeatherController(WeatherService()));
  }
}
