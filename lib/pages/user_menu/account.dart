// imports
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/small_text.dart';
import 'package:food_delivery_flutter/widgets/top_navbar.dart';

// Account class
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
                    color: AppColors.titleColor,
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
                color: AppColors.buttonBackgroundColor,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Here will display Camera details',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: FloatingActionButton.extended(
                      heroTag: Text('btn1'),
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: Colors.white,
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: 'Change Your Password',
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.titleColor,
                                ),
                              ]),
                          content: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              style: TextStyle(color: AppColors.paraColor),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your email',
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: SmallText(
                                      text: 'Cancel',
                                      color: AppColors.paraColor,
                                      size: Dimensions.size15,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextButton(
                                  //need to add action to reset password
                                  onPressed: () =>
                                      Navigator.pop(context, 'Reset Password'),
                                  child: SmallText(
                                    text: 'Reset Password',
                                    color: AppColors.paraColor,
                                    size: Dimensions.size15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Delete Account\n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.titleColor,
                                        fontSize: Dimensions.size20),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Are you sure you want to\n    delete your account?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.mainBlackColor,
                                        fontSize: Dimensions.size15),
                                  ),
                                ],
                              )
                            ],
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'No'),
                                  child: SmallText(
                                    text: 'No',
                                    color: AppColors.paraColor,
                                    size: Dimensions.size15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Yes'),
                                    child: SmallText(
                                      text: 'Yes',
                                      color: AppColors.paraColor,
                                      size: Dimensions.size15,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
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
