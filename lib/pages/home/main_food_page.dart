import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
import 'package:food_delivery_flutter/widgets/menu_item.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Setting';
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 35, bottom: 10),
              padding: EdgeInsets.only(
                  left: Dimensions.size20, right: Dimensions.size20, top: 0),
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
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(child: FoodPageBody()),
          ),
        ],
      ),
    );
  }
}
