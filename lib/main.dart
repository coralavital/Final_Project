// imports
import 'package:final_project/controllers/product_controller.dart';
import 'package:final_project/controllers/list_controller.dart';
import 'package:final_project/helper/dependencies.dart' as dep;
import 'package:final_project/pages/auth/auth_gate.dart';
import 'package:final_project/routes/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

// main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'FridgeIT',
   options: DefaultFirebaseOptions.currentPlatform,
 );
  await dep.init();
  runApp(MyApp());
}

// MyApp class
class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<ListController>().getCardData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FridgeIT',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          initialRoute: RouteHelper.getSplash(),
          getPages: RouteHelper.routes,
          home: const AuthGate(),
          );
    });
  }
}
