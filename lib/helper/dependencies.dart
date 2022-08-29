// imports
import 'package:food_delivery_flutter/controllers/list_controller.dart';
import 'package:food_delivery_flutter/controllers/product_controller.dart';
import 'package:food_delivery_flutter/data/api/api_client.dart';
import 'package:food_delivery_flutter/data/repository/product_repo.dart';
import 'package:food_delivery_flutter/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repository/list_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => ListRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => ListController(listRepo: Get.find()));
}
