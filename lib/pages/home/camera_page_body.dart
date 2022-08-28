import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/controllers/popular_product_controller.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/utils/constants.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:get/get.dart';
import '../../models/products_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.size260;
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
              ? Container(
                  height: Dimensions.size550,
                  child: PageView.builder(
                      controller: pageController,
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
              activeColor: AppColors.mainColor,
              size: const Size.square(10.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //SizedBox(height: Dimensions.size30),
        //Container(
        //  margin: EdgeInsets.only(left: Dimensions.size30),
        //  child: Row(
        //    crossAxisAlignment: CrossAxisAlignment.end,
        //    children: [
        //      BigText(text: 'Recommended'),
        //      SizedBox(width: Dimensions.size10),
        //      Container(
        //        margin: EdgeInsets.only(bottom: 3),
        //        child: BigText(text: '.', color: Colors.black26),
        //      ),
        //      SizedBox(width: Dimensions.size10),
        //      Container(
        //        margin: EdgeInsets.only(bottom: 2),
        //        child: SmallText(text: 'Food pairing'),
        //      )
        //    ],
        //  ),
        //),
        ////Recommended food*****************************
        //GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
        //  return recommendedProduct.isLoaded
        //      ? ListView.builder(
        //          physics: NeverScrollableScrollPhysics(),
        //          shrinkWrap: true,
        //          itemCount: recommendedProduct.recommendedProductList.length,
        //          itemBuilder: (context, index) {
        //            return GestureDetector(
        //              onTap: () {
        //                Get.toNamed(RouteHelper.getRecommendedFood(index));
        //              },
        //              child: Container(
        //                margin: EdgeInsets.symmetric(
        //                  horizontal: Dimensions.size5,
        //                  vertical: Dimensions.size5,
        //                ),
        //                child: Row(
        //                  children: [
        //                    //image section**************
        //                    Container(
        //                      width: Dimensions.size120,
        //                      height: Dimensions.size120,
        //                      decoration: BoxDecoration(
        //                        borderRadius:
        //                            BorderRadius.circular(Dimensions.size20),
        //                        color: Colors.white38,
        //                        image: DecorationImage(
        //                            fit: BoxFit.cover,
        //                            image: NetworkImage(AppConstants.baseUrl +
        //                                '/uploads/' +
        //                                recommendedProduct
        //                                    .recommendedProductList[index]
        //                                    .img!)),
        //                      ),
        //                    ),
        //                    Expanded(
        //                      child: Container(
        //                        height: Dimensions.size100,
        //                        decoration: BoxDecoration(
        //                          borderRadius: BorderRadius.only(
        //                            topRight:
        //                                Radius.circular(Dimensions.size20),
        //                            bottomRight:
        //                                Radius.circular(Dimensions.size20),
        //                          ),
        //                          color: Colors.white,
        //                        ),
        //                        child: Padding(
        //                          padding:
        //                              EdgeInsets.only(left: Dimensions.size10),
        //                          child: Column(
        //                            crossAxisAlignment:
        //                                CrossAxisAlignment.start,
        //                            mainAxisAlignment:
        //                                MainAxisAlignment.spaceBetween,
        //                            children: [
        //                              BigText(
        //                                  text: recommendedProduct
        //                                      .recommendedProductList[index]
        //                                      .name!),
        //                              SmallText(
        //                                  text:
        //                                      'With Chinese characteristics.'),
        //                              Row(
        //                                mainAxisAlignment:
        //                                    MainAxisAlignment.spaceBetween,
        //                                children: [
        //                                  IconAndTextWidget(
        //                                      icon: Icons.circle_sharp,
        //                                      text: 'Normal',
        //                                      iconColor: AppColors.iconColor1),
        //                                  IconAndTextWidget(
        //                                      icon: Icons.location_on,
        //                                      text: '1.7 km',
        //                                      iconColor: AppColors.mainColor),
        //                                  IconAndTextWidget(
        //                                      icon: Icons.access_time_rounded,
        //                                      text: '32 min',
        //                                      iconColor: AppColors.iconColor2),
        //                                ],
        //                              ),
        //                            ],
        //                          ),
        //                        ),
        //                      ),
        //                    ),
        //                  ],
        //                ),
        //              ),
        //            );
        //          })
        //      : CircularProgressIndicator(
        //          color: AppColors.mainColor,
        //        );
        //})
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
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
              height: Dimensions.size550,
              margin: EdgeInsets.only(
                  left: Dimensions.size10,
                  right: Dimensions.size10,
                  top: Dimensions.size10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xff69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstants.baseUrl + '/uploads/' + popularProduct.img!),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Dimensions.size10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.size50,
                  height: Dimensions.size50,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.mainColor,
                    foregroundColor: Colors.white,
                    heroTag: Text('btn4'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cameras');
                    },
                    child: Icon(
                      Icons.add,
                      size: Dimensions.size30,
                    ),
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
