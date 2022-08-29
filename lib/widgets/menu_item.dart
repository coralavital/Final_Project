// imports
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
  static const List<NavbarMenuItem> firstItems = [account];
  static const List<NavbarMenuItem> secondItems = [logout];

  static const account =
      NavbarMenuItem(text: 'Account', icon: Icons.account_circle_rounded);
  static const logout = NavbarMenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(NavbarMenuItem item) {
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

  static onChanged(BuildContext context, NavbarMenuItem item) {
    switch (item) {
      case NavbarMenuItems.account:
        Navigator.of(context).pushNamed('/account');
        break;
      case NavbarMenuItems.logout:
        Navigator.of(context).pushNamed('/cameras');
        break;
    }
  }
}
