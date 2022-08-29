// imports
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/pages/lists/list_page.dart';
import 'package:food_delivery_flutter/pages/home/main_page.dart';
import 'package:food_delivery_flutter/utils/colors.dart';
import '../../utils/dimensions.dart';

// HomePage class
class HomePage extends StatefulWidget {
  int selectedIndex;
  HomePage({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  List pages = [ListPage(), MainPage(), ListPage()];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [ListPage(), MainPage(), ListPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.iconColor1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'poductList',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: Dimensions.size30,
              //color: Colors.white,
            ),
            label: 'home',
            backgroundColor: AppColors.mainColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: 'expiredList'),
        ],
      ),
    );
  }
}
