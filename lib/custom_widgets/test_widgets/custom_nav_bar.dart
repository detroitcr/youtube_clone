import 'package:flutter/material.dart';


// for testing

class CustomBottomBar extends StatelessWidget {
// A list of tabs to display
  final List<CustomBottomBar> items;
// Tab to display
  final int? currentIndex;
// Return the index of the tab that was tapped
  final Function(int)? onTap;
// The color of the icon and text when the item was selected
  final Color? selectedItemColor;
// The color of the icon and text when the item was unselected
  final Color? unselectedItemColor;
// The opacity of color of the touchable background when the item is selected
  final double? selectedColorOpacity;
// The border shape of each item
  final ShapeBorder? itemShape;
// margin surrounding the environment of widget
  final EdgeInsets? margin;
// the padding of each item
  final EdgeInsets? itemPadding;
// The transition duration
  final Duration? duration;
// transtion curve
  final Curve? curve;

  const CustomBottomBar({
    Key? key,
    required this.items,
    this.margin,
    this.currentIndex,
    this.curve,
    this.duration,
    this.itemPadding,
    this.itemShape,
    this.onTap,
    this.selectedColorOpacity,
    this.selectedItemColor,
    this.unselectedItemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }
}

class CustomBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final Widget title;
  final Color? selectedColor;
  final Color? unselectedColor;
  CustomBarItem(
      {required this.icon,
      required this.title,
      this.activeIcon,
      this.selectedColor,
      this.unselectedColor});
}
