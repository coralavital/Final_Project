// imports
import 'package:final_project/utils/dimensions.dart';
import 'package:flutter/material.dart';

// NavbarMenuItem class
class NavbarMenuItem {
  final String text;
  final IconData icon;

  const NavbarMenuItem({
    required this.text,
    required this.icon,
  });
}

class NavbarMenuItems {
  static const List<NavbarMenuItem> firstItems = [about];
  static const List<NavbarMenuItem> secondItems = [help];
  static const List<NavbarMenuItem> thirdItems = [logout];

  static const help =
      NavbarMenuItem(text: 'Help', icon: Icons.help_center_rounded);
  static const about =
      NavbarMenuItem(text: 'About', icon: Icons.info_outline_rounded);
  static const logout = NavbarMenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(NavbarMenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: Dimensions.size15),
        SizedBox(
          width: Dimensions.size5,
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

  static onChanged(BuildContext context, NavbarMenuItem item) {
    switch (item) {
      case NavbarMenuItems.help:
        Navigator.of(context).pushNamed('/help');
        break;
      case NavbarMenuItems.about:
        Navigator.of(context).pushNamed('/help');
        break;
      case NavbarMenuItems.logout:
        Navigator.of(context).pushNamed('/cameras');
        break;
    }
  }
}
