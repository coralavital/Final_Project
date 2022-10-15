// imports
import 'package:final_project/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/widgets/big_text.dart';
import 'package:final_project/widgets/top_navbar.dart';

// Account class
class About extends StatefulWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  State<About> createState() => _AboutPageState();
}

class _AboutPageState extends State<About> {
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
                    text: "About flutter_application_1",
                    size: Dimensions.size30,
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(
                    height: Dimensions.size15,
                  ),
                  SmallText(
                    textAlign: TextAlign.center,
                    size: Dimensions.size15,
                    text:
                        "At flutter_application_1, we're building new and innovative ways to help people understand and talk about sustainability"
                        "and the makeup of our company reflects the diverse perspectives of the people who use our technologies."
                        "The product is designed to record products that are in the refrigerator and in addition to allow products to be scanned in"
                        "order to get the expiration date of products and to help people keep track of the products they have and the expiration date of these products.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
