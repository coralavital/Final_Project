// imports
import 'package:final_project/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:final_project/base/no_data_page.dart';
import 'package:final_project/controllers/list_controller.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../widgets/top_navbar.dart';

// ShoppingPage class
class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);
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
                    right: Dimensions.size20,
                    bottom: 0,
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
                                            right: Dimensions.size10,
                                          ),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                listController
                                                    .getItems[index].img!,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BigText(
                                                  text: listController
                                                      .getItems[index].name!,
                                                  color:
                                                      AppColors.mainBlackColor,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SmallText(
                                                  text: "Expired Date:",
                                                  textAlign: TextAlign.center,
                                                  fontWeight: FontWeight.w500,
                                                  size: Dimensions.size10,
                                                ),
                                                SmallText(
                                                  text: "22/11/2023",
                                                  textAlign: TextAlign.center,
                                                  fontWeight: FontWeight.w400,
                                                  size: Dimensions.size15,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    Dimensions
                                                                        .size20),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                AppColors
                                                                    .mainColor),
                                                  ),
                                                  onPressed: () {},
                                                  child: SmallText(
                                                    text: "Add to cart",
                                                    color: Colors.white,
                                                    size: Dimensions.size10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
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
                  )
                : const NoDataPage(text: 'Your list is empty.');
          }),
        ],
      ),
    );
  }
}
