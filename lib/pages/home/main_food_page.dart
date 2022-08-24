import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import 'package:food_delivery_flutter/widgets/big_text.dart';
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
    //print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 35, bottom: 10),
              padding: EdgeInsets.only(left: 20, right: 20, top: 0),
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
                          Icons.list,
                          size: 46,
                          color: Colors.teal,
                        ),
                        customItemsIndexes: const [3],
                        customItemsHeight: 8,
                        items: [
                          ...MenuItems.firstItems.map(
                            (item) => DropdownMenuItem<MenuItem>(
                              value: item,
                              child: MenuItems.buildItem(item),
                            ),
                          ),
                          const DropdownMenuItem<Divider>(
                              enabled: false, child: Divider()),
                          ...MenuItems.secondItems.map(
                            (item) => DropdownMenuItem<MenuItem>(
                              value: item,
                              child: MenuItems.buildItem(item),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          MenuItems.onChanged(context, value as MenuItem);
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

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [settings];
  static const List<MenuItem> secondItems = [logout];

  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 15),
        const SizedBox(
          width: 5,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.logout:
        //Do something
        break;
    }
  }
}
