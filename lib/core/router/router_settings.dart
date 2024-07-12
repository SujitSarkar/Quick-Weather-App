part of 'router_imports.dart';

class GeneratedPages {
  static List<GetPage> pages = [
    //Splash
    GetPage(
      name: RouterPaths.initializer,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),

    //Weather
    GetPage(
      name: RouterPaths.weather,
      page: () => const WeatherScreen(),
      binding: WeatherBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
