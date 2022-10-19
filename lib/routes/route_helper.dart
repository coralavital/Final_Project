// imports
import 'package:final_project/pages/auth/auth_gate.dart';
import 'package:final_project/pages/screens/products_list.dart';
import 'package:final_project/pages/account/account.dart';
import 'package:final_project/pages/home/home_page.dart';
import 'package:final_project/pages/screens/shopping_list.dart';
import 'package:final_project/pages/menu_item/about.dart';
import 'package:final_project/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/menu_item/help.dart';

// RouteHelper class
class RouteHelper {
  static const String splash = '/splash-page';
  static const String initial = '/';
  static const String cameras = '/cameras';
  static const String account = '/account';
  static const String listPage = '/list-page';
  static const String shoppingPage = '/shopping-page';
  static const String help = '/help';
  static const String about = '/about';
  static const String auth = '/auth';

  static String getSplash() => splash;
  static String getInitial() => initial;
  static String getAccount() => account;
  static String getListPage() => listPage;
  static String getShoppingPage() => shoppingPage;
  static String getHelp() => help;
  static String getAbout() => about;
  static String getAuth() => auth;

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
      name: about,
      page: () {
        return const About();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: auth,
      page: () {
        return const AuthGate();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: listPage,
      page: () {
        return ListPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: shoppingPage,
        page: () {
          return ShoppingPage();
        },
        transition: Transition.fadeIn),
  ];
}
