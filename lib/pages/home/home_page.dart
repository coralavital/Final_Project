// imports
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:final_project/pages/lists/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project/pages/lists/list_page.dart';
import 'package:final_project/pages/home/main_page.dart';
import 'package:final_project/utils/colors.dart';
import '../account/account.dart';

// HomePage class
class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            MainPage(),
            ShoppingPage(),
            ListPage(),
            Account(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        backgroundColor: AppColors.buttonBackgroundColor,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: AppColors.paraColor,
              title: Text(
                'Home',
                style: TextStyle(color: AppColors.mainColor),
              ),
              icon: Icon(Icons.home, color: AppColors.mainColor)),
          BottomNavyBarItem(
              activeColor: AppColors.paraColor,
              title: Text(
                'Shopping List',
                style: TextStyle(color: AppColors.mainColor),
              ),
              icon: Icon(Icons.shopping_cart_rounded,
                  color: AppColors.mainColor)),
          BottomNavyBarItem(
              activeColor: AppColors.paraColor,
              title: Text(
                'Product List',
                style: TextStyle(color: AppColors.mainColor),
              ),
              icon: Icon(Icons.list_alt_rounded, color: AppColors.mainColor)),
          BottomNavyBarItem(
            activeColor: AppColors.paraColor,
            title: Text(
              'Me',
              style: TextStyle(color: AppColors.mainColor),
            ),
            icon:
                Icon(Icons.account_circle_rounded, color: AppColors.mainColor),
          ),
        ],
      ),
    );
  }
}
