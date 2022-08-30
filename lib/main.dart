// imports
import 'package:flutter/material.dart';
import 'package:final_project/controllers/list_controller.dart';
import 'package:final_project/controllers/product_controller.dart';
import 'package:final_project/helper/dependencies.dart' as dep;
import 'package:final_project/routes/route_helper.dart';
import 'package:get/get.dart';

// main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

// MyApp class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<ListController>().getCardData();
    return GetBuilder<PopularProductController>(builder: (_) {
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
  }
}
