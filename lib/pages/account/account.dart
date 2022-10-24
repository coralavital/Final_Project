import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import '../../widgets/custom_profile_screen.dart';
import '../../widgets/top_navbar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomProfileScreen(
          actions: [
            SignedOutAction((context) {
              Navigator.of(context).pushNamed('/auth');
            })
          ],
        ),
        TopNavbar(
          icon: const Icon(
            Icons.list_rounded,
          ),
        ),
      ],
    );
  }
}
