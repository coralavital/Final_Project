// imports
import 'package:flutter/material.dart';
import 'package:final_project/utils/dimensions.dart';

// BigText class
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  double size;
  TextOverflow overflow;
  BigText({
    Key? key,
    this.fontWeight = FontWeight.w500,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight:
            fontWeight == 0 ? FontWeight.w500 : fontWeight,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.size20 : size,
      ),
    );
  }
}
