part of 'router_imports.dart';

class GeneratedPages {
  static List<GetPage> pages = [
    //Weather
    GetPage(
      name: RouterPaths.initializer,
      page: () => const WeatherScreen(),
      binding: WeatherBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
