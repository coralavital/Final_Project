// imports
import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/widgets/small_text.dart';
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

  static const help =
      NavbarMenuItem(text: 'Help', icon: Icons.help_center_rounded);
  static const about =
      NavbarMenuItem(text: 'About', icon: Icons.info_outline_rounded);

  static Widget buildItem(NavbarMenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: Dimensions.size15),
        SizedBox(
          width: Dimensions.size5,
        ),
        SmallText(
          text: item.text,
          size: 15,
          color: Colors.white,
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
        Navigator.of(context).pushNamed('/about');
        break;
    }
  }
}
