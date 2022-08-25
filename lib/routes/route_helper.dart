import 'package:food_delivery_flutter/pages/cart/cart_page.dart';
import 'package:food_delivery_flutter/pages/food/settings.dart';
import 'package:food_delivery_flutter/pages/home/home_page.dart';
import 'package:food_delivery_flutter/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splash = '/splash-page';
  static const String initial = '/';
  static const String cameras = '/cameras';
  static const String settings = '/settings';
  static const String cartPage = '/cart-page';

  static String getSplash() => '$splash';
  static String getInitial() => '$initial';
  static String getSettings() => '$settings';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
      name: settings,
      page: () {
        return Settings();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
