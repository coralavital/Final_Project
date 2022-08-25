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
    return Positioned(
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
                    NavbarMenuItems.onChanged(context, value as NavbarMenuItem);
                  },
                  itemHeight: 25,
                  itemPadding: const EdgeInsets.only(left: 16, right: 16),
                  dropdownWidth: 120,
                  dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.teal,
                  ),
                  dropdownElevation: 8,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
          ],
        ));
  }
}
