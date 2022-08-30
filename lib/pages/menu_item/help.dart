// imports
import 'package:flutter/material.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/widgets/big_text.dart';
import 'package:final_project/widgets/top_navbar.dart';

// Account class
class Help extends StatefulWidget {
  const Help({
    Key? key,
  }) : super(key: key);

  @override
  State<Help> createState() => _HelpPageState();
}

class _HelpPageState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          TopNavbar(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.size80,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.size20,
                vertical: Dimensions.size10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.size20),
                    topRight: Radius.circular(Dimensions.size20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: "Help",
                    size: Dimensions.size30,
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            child: Text(""),
          ),
        ],
      ),
    );
  }
}
