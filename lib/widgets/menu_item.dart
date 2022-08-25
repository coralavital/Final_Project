import 'package:flutter/material.dart';

class NavbarMenuItem {
  final String text;
  final IconData icon;

  const NavbarMenuItem({
    required this.text,
    required this.icon,
  });
}

class NavbarMenuItems {
  static const List<NavbarMenuItem> firstItems = [settings];
  static const List<NavbarMenuItem> secondItems = [logout];

  static const settings =
      NavbarMenuItem(text: 'Settings', icon: Icons.settings);
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
      case NavbarMenuItems.settings:
        Navigator.of(context).pushNamed('/settings');
        break;
      case NavbarMenuItems.logout:
        Navigator.of(context).pushNamed('/cameras');
        break;
    }
  }
}
