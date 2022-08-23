import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/pages/cart/cart_history.dart';
import 'package:food_delivery_flutter/pages/home/main_food_page.dart';
import 'package:food_delivery_flutter/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text('Next page'))),
    CartHistory(),
    Container(child: Center(child: Text('Next next next page'))),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child: Text('Next page'))),
      Container(child: Center(child: Text('Next next page'))),
      Container(child: Center(child: Text('Next next next page'))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'shoppingCart'),
        ],
      ),
    );
  }
}
