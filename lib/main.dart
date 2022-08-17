import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/pages/food/popular_food_details.dart';
import 'package:food_delivery_flutter/pages/food/recommended_food_detail.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'pages/home/main.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
