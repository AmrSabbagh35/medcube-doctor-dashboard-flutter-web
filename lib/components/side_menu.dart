import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/components/side_menu_item.dart';
import 'package:medsquare_web/constants/controllers.dart';
import 'package:medsquare_web/constants/style.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';
import 'package:medsquare_web/routes/routes.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(FontAwesomeIcons.userDoctor),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Med Square",
                        size: 20,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sidemenuitems
                .map((itemname) => SideMenuItem(
                    itemName: itemname == AuthenticationPageRoute
                        ? "Log out"
                        : itemname,
                    onTap: () {
                      if (itemname == AuthenticationPageRoute) {}
                      if (!menuController.isActive(itemname)) {
                        menuController.changeActiveItem(itemname);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(itemname);
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
