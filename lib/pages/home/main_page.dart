// imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_flutter/widgets/top_navbar.dart';
import 'camera_page_body.dart';

// MainFoodPage class
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Setting';
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Column(
        children: [
          TopNavbar(),
          Expanded(
            child: SingleChildScrollView(child: FoodPageBody()),
          ),
        ],
      ),
    );
  }
}