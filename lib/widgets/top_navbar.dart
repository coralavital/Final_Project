// imports
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgets/menu_item.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'menu_item.dart';

// TopNavbar class
class TopNavbar extends StatelessWidget {
  Icon icon;
  TopNavbar({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon.icon == Icons.list_rounded
        ? Container(
            margin: EdgeInsets.only(
              left: Dimensions.size20,
              right: Dimensions.size20,
              top: Dimensions.size30,
            ),
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
                      customButton: Icon(Icons.list_rounded,
                          size: Dimensions.size30, color: AppColors.mainColor),
                      customItemsIndexes: const [4],
                      customItemsHeight: Dimensions.size20,
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
                        const DropdownMenuItem<Divider>(
                            enabled: false, child: Divider()),
                        ...NavbarMenuItems.thirdItems.map(
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
                      itemHeight: Dimensions.size15,
                      itemPadding: EdgeInsets.only(
                          left: Dimensions.size15, right: Dimensions.size15),
                      dropdownWidth: Dimensions.size120,
                      dropdownMaxHeight: Dimensions.size150,
                      dropdownPadding: EdgeInsets.symmetric(
                        vertical: Dimensions.size15,
                      ),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.mainColor,
                      ),
                      dropdownElevation: 8,
                      offset: const Offset(2, 8),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(
              left: Dimensions.size20,
              right: Dimensions.size20,
              top: Dimensions.size40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.size30),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.mainColor),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
