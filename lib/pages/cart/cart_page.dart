import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/base/no_data_page.dart';
import 'package:food_delivery_flutter/controllers/cart_controller.dart';
import 'package:food_delivery_flutter/controllers/popular_product_controller.dart';
import 'package:food_delivery_flutter/routes/route_helper.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/utils/constants.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../widgets/menu_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.size20,
              right: Dimensions.size20,
              top: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'FridgeIT', color: AppColors.mainColor),
                    ],
                  ),
                  Column(
                    children: [
                      DropdownButton2(
                        customButton: const Icon(
                          Icons.list_sharp,
                          size: 46,
                          color: Colors.teal,
                        ),
                        customItemsIndexes: const [3],
                        customItemsHeight: 8,
                        items: [
                          ...NavbarMenuItems.firstItems.map(
                            (item) => DropdownMenuItem<NavbarMenuItem>(
                              value: item,
                              child: NavbarMenuItems.buildItem(item),
                            ),
                          ),
                          const DropdownMenuItem<Divider>(
                              enabled: false, child: Divider()),
                          ...NavbarMenuItems.secondItems.map(
                            (item) => DropdownMenuItem<NavbarMenuItem>(
                              value: item,
                              child: NavbarMenuItems.buildItem(item),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          NavbarMenuItems.onChanged(
                              context, value as NavbarMenuItem);
                        },
                        itemHeight: 25,
                        itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 120,
                        dropdownPadding:
                            const EdgeInsets.symmetric(vertical: 6),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.teal,
                        ),
                        dropdownElevation: 8,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  //Center(
                  //  child: Container(
                  //    width: Dimensions.size45,
                  //    height: Dimensions.size45,
                  //    child: Icon(Icons.search, color: Colors.white),
                  //    decoration: BoxDecoration(
                  //      borderRadius: BorderRadius.circular(15),
                  //      color: AppColors.mainColor,
                  //    ),
                  //  ),
                  //),
                ],
              )),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.size20 * 4.5,
                    left: Dimensions.size20,
                    right: Dimensions.size20,
                    bottom: 0,
                    child: Container(
                      //color: Colors.red,
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                              builder: (cartController) {
                            var _cartList = cartController.getItems;
                            return ListView.builder(
                                itemCount: _cartList.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    height: Dimensions.size20 * 5,
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            var popularIndex = Get.find<
                                                    PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            if (popularIndex >= 0) {
                                              Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularIndex, 'cartpage'),
                                              );
                                            } 
                                          },
                                          child: Container(
                                            width: Dimensions.size20 * 7,
                                            height: Dimensions.size20 * 5,
                                            margin: EdgeInsets.only(
                                              bottom: Dimensions.size10,
                                              right: Dimensions.size10,
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  AppConstants.baseUrl +
                                                      AppConstants.uploadUrl +
                                                      cartController
                                                          .getItems[index].img!,
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.size20,
                                              ),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          height: Dimensions.size20 * 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                      Dimensions.size20,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimensions.size20,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                -1);
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .signColor,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 5.0,
                                                          ),
                                                          child: BigText(
                                                            text:
                                                                _cartList[index]
                                                                    .quantity
                                                                    .toString(),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: AppColors
                                                                .signColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  );
                                });
                          })),
                    ),
                  )
                : NoDataPage(text: 'Your list is empty.');
          }),
        ],
      ),
    );
  }
}
