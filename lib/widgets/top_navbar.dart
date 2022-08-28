import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/widgets/menu_item.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: Dimensions.size20,
        right: Dimensions.size20,
        top: Dimensions.size40, ),
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
                  customButton: Icon(
                    Icons.account_circle_rounded,
                    size: Dimensions.size30,
                    color: AppColors.mainColor
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
                    NavbarMenuItems.onChanged(context, value as NavbarMenuItem);
                  },
                  itemHeight: Dimensions.size20,
                  itemPadding: EdgeInsets.only(left: Dimensions.size15, right: Dimensions.size15),
                  dropdownWidth: Dimensions.size120,
                  dropdownPadding: const EdgeInsets.symmetric(vertical: 8),
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
        ));
  }
}
