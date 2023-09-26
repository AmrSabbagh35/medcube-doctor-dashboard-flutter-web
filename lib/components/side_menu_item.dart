import 'package:flutter/material.dart';
import 'package:medsquare_web/components/horizontal_menu_item.dart';
import 'package:medsquare_web/components/vertical_menu_item.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context)) {
      return VertticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    } else {
      return HorizontalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
  }
}
