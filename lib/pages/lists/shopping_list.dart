// imports
import 'package:flutter/material.dart';
import 'package:final_project/base/no_data_page.dart';
import 'package:final_project/controllers/list_controller.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/constants.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../widgets/top_navbar.dart';

// ShoppingPage class
class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopNavbar(
            icon: const Icon(Icons.list_rounded),
          ),
          GetBuilder<ListController>(builder: (_cartController) {
            return _cartController.getItems.isNotEmpty
                ? Positioned(
                    top: Dimensions.size20 * 4.5,
                    left: Dimensions.size20,
                    right: Dimensions.size50,
                    bottom: 0,
                    child: Container(
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<ListController>(
                              builder: (listController) {
                            var _list = listController.getItems;
                            return ListView.builder(
                                itemCount: _list.length,
                                itemBuilder: (_, index) {
                                  return SizedBox(
                                    height: Dimensions.size20 * 5,
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            width: Dimensions.size20 * 5,
                                            height: Dimensions.size20 * 5,
                                            margin: EdgeInsets.only(
                                              bottom: Dimensions.size10,
                                              right: Dimensions.size30,
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  listController
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
                                            child: SizedBox(
                                          height: Dimensions.size20 * 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  BigText(
                                                    text: listController
                                                        .getItems[index].name!,
                                                    color: AppColors
                                                        .mainBlackColor,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            listController
                                                                .addItem(
                                                                    _list[index]
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
                                                            text: _list[index]
                                                                .quantity
                                                                .toString(),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            listController
                                                                .addItem(
                                                                    _list[index]
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
                : const NoDataPage(text: 'Your list is empty.');
          }),
        ],
      ),
    );
  }
}
