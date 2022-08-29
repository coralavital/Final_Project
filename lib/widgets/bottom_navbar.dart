// imports
import 'package:flutter/material.dart';

import 'package:food_delivery_flutter/utils/dimensions.dart';
import '../pages/home/main_page.dart';
import '../utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List pages = [MainPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.mainColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: 0,
      onTap: (value) => Navigator.of(context).pushNamed('/cameras'),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: Dimensions.size30,
          ),
          label: 'home',
        ),
      ],
    );
  }
}
