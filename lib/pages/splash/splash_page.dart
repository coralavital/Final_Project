// imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:final_project/routes/route_helper.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';

// SplashScreen class
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    Timer(
      const Duration(seconds: 4),
      () => Get.offNamed(
        RouteHelper.getInitial(),
      ),
    );
    _loadResource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/image/Icon-FridgeIT.png',
                width: Dimensions.size30 * 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
