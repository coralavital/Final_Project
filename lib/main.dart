// imports

import 'package:final_project/pages/auth/auth_gate.dart';
import 'package:final_project/routes/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

// main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// MyApp class
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FridgeIT',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: RouteHelper.getSplash(),
      getPages: RouteHelper.routes,
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return const AuthGate();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
