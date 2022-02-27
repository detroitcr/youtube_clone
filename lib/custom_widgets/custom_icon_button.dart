import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  
  final Widget icon;

  final Function() onpressed;

  final double? size;

  const CustomIconButton({Key? key,required this.icon,required this.onpressed,this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onpressed,
      iconSize: size,
    );
  }
}
