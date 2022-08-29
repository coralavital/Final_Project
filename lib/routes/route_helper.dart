// imports
import 'package:food_delivery_flutter/pages/lists/list_page.dart';
import 'package:food_delivery_flutter/pages/user_menu/account.dart';
import 'package:food_delivery_flutter/pages/home/home_page.dart';
import 'package:food_delivery_flutter/pages/splash/splash_page.dart';
import 'package:get/get.dart';

// RouteHelper class
class RouteHelper {
  static const String splash = '/splash-page';
  static const String initial = '/';
  static const String cameras = '/cameras';
  static const String account = '/account';
  static const String shoppingPage = '/shopping-page';

  static String getSplash() => '$splash';
  static String getInitial() => '$initial';
  static String getAccount() => '$account';
  static String getCartPage() => '$shoppingPage';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
      name: account,
      page: () {
        return Account();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: shoppingPage,
        page: () {
          return ListPage();
        },
        transition: Transition.fadeIn),
  ];
}
