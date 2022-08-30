// imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project/widgets/top_navbar.dart';
import 'camera_page_body.dart';

// MainPage class
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Column(
        children: [
          TopNavbar(
            icon: const Icon(Icons.list_rounded),
          ),
          const Expanded(
            child: SingleChildScrollView(child: MainPageBody()),
          ),
        ],
      ),
    );
  }
}
