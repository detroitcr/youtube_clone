import 'package:flutter/material.dart';

class CrText extends StatelessWidget {
  // For entered text
  final String text;
  // For entered size
  final double? size;
  //For Weight of font
  final FontWeight? weight;
  // For Font Color
  final Color? color;
  // For Fontfamily
  final String? family;

  const CrText({
    Key? key,
    required this.text,
    this.color,
    this.size,
    this.family,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 24,
        fontFamily: family,
        fontWeight: weight ?? FontWeight.w700,
      ),
    );
  }
}
