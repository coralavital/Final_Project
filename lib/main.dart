import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/controllers/cart_controller.dart';
import 'package:food_delivery_flutter/controllers/popular_product_controller.dart';
import 'package:food_delivery_flutter/helper/dependencies.dart' as dep;
import 'package:food_delivery_flutter/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCardData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          initialRoute: RouteHelper.getSplash(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
