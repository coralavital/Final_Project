import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/animation_state.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/top_navbar.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          TopNavbar(),
          Positioned(
            left: 0,
            right: 0,
            top: 90,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.size20,
                vertical: Dimensions.size10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: "Settings",
                    size: Dimensions.size30,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w900,
                  ),
                  //AnimationIcon()
                ],
              ),
            ),
          ),
          Positioned(
            left: Dimensions.size10,
            right: Dimensions.size10,
            top: Dimensions.size210,
            child: Container(
              width: Dimensions.size50,
              height: Dimensions.size300,
              decoration: BoxDecoration(
                color: AppColors.iconColor1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: Colors.white,
                      onPressed: () {},
                      label: BigText(
                        text: "Password Setting",
                        size: Dimensions.size15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.size10,
                  ),
                  Container(
                    child: FloatingActionButton.extended(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: Colors.white,
                      onPressed: () {},
                      label: BigText(
                        text: "Delete Account",
                        size: Dimensions.size15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Dimensions.size10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.size60,
                    height: Dimensions.size60,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cameras');
                      },
                      child: Icon(
                        Icons.home,
                        size: Dimensions.size45,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
