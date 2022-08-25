import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class AnimationIcon extends StatefulWidget {
  Icon icon;
  AnimationIcon({Key? key, required this.icon}) : super(key: key);
  _AnimationIconState createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: (Duration(seconds: 5)),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);
    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });
    animController.forward();
  }

  @override
  Widget build(BuildContext contextn) {
    return Scaffold(
      body: Transform.rotate(
        angle: animController.value,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(Dimensions.size10),
          child: Icon(
            widget.icon,
            size: Dimensions.size45,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
