import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/top_navbar.dart';

class Account extends StatelessWidget {
  const Account({
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: "My Account",
                    size: Dimensions.size30,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: Dimensions.size10,
            right: Dimensions.size10,
            top: Dimensions.size150,
            child: Container(
              width: Dimensions.size50,
              height: Dimensions.size450,
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
                      heroTag: Text('btn1'),
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
                      heroTag: Text('btn2'),
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
                    width: Dimensions.size50,
                    height: Dimensions.size50,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: Colors.white,
                      heroTag: Text('btn3'),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cameras');
                      },
                      child: Icon(
                        Icons.home,
                        size: Dimensions.size30,
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
