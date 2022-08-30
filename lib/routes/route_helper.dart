// imports
import 'package:final_project/pages/lists/list_page.dart';
import 'package:final_project/pages/account/account.dart';
import 'package:final_project/pages/home/home_page.dart';
import 'package:final_project/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/menu_item/help.dart';

// RouteHelper class
class RouteHelper {
  static const String splash = '/splash-page';
  static const String initial = '/';
  static const String cameras = '/cameras';
  static const String account = '/account';
  static const String shoppingPage = '/shopping-page';
  static const String help = '/help';

  static String getSplash() => splash;
  static String getInitial() => initial;
  static String getAccount() => account;
  static String getCartPage() => shoppingPage;
  static String getHelp() => help;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
      name: account,
      page: () {
        return const Account();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: help,
      page: () {
        return const Help();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: shoppingPage,
        page: () {
          return const ListPage();
        },
        transition: Transition.fadeIn),
  ];
}
