import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  bool overflow;
  final FontWeight weight;

  CustomText(
      {Key? key,
      required this.text,
      this.size = 16,
      this.overflow = false,
      this.color = Colors.black,
      this.weight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?TextOverflow.ellipsis:null,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
