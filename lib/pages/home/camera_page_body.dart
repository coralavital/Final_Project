// imports
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:final_project/controllers/product_controller.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/constants.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../widgets/small_text.dart';

// FoodPageBody class
class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.size260;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? SizedBox(
                  height: Dimensions.size530,
                  child: PageView.builder(
                      controller: pageController,
                      // itemCount for two cameras
                      itemCount: 2,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty ? 1 : 2,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.paraColor,
              size: Size.square(Dimensions.size10),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.size5)),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel cameraProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            child: Container(
              // image height
              height: Dimensions.size490,
              margin: EdgeInsets.only(
                  left: Dimensions.size10,
                  right: Dimensions.size10,
                  top: Dimensions.size20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.size20),
                color: index.isEven ? const Color(0xff69c5df) : const Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstants.baseUrl + '/uploads/' + cameraProduct.img!),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.size20),
                          ),
                          onSurface: AppColors.mainColor,
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.size20),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Choose Product\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.paraColor,
                                          fontSize: Dimensions.size20),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Does the product you want to\nadd have an expiration date?',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'No'),
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
                        child: Icon(
                          Icons.add,
                          size: Dimensions.size30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
