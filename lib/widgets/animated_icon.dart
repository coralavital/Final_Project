import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/utils/dimensions.dart';


class AnimatedIconScreen extends StatefulWidget {
  @override
  _AnimatedIconDemoScreenState createState() => _AnimatedIconDemoScreenState();
}

class _AnimatedIconDemoScreenState extends
State<AnimatedIconScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // New: icon states: show menu vs. show close.
  bool isShowingMenu = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this,
            duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // New: Wrap icon to handle onTap event
      child: InkWell(
        child: AnimatedIcon(
          size: 2,
          color: Colors.blue,
          icon: AnimatedIcons.close_menu,
          progress: _animationController,
        ),
        // New: handle onTap event
        onTap: () {
          // Update the state
          isShowingMenu = !isShowingMenu;
          if (isShowingMenu) {
            // Trigger animation (start: close -> menu)
            _animationController.forward();
          } else {
            // Trigger animation (revert: menu -> close)
            _animationController.reverse();
          }
        },
      ),
    );
  }
}