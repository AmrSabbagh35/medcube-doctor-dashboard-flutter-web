import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/constants/style.dart';
import 'package:medsquare_web/routes/routes.dart';

class CustomMenuController extends GetxController {
  static CustomMenuController instance = Get.find();
  var activeitem = RecordPageRoute.obs;
  var hoveritem = "".obs;

  changeActiveItem(String itemname) {
    activeitem.value = itemname;
  }

  onHover(String itemname) {
    if (!isActive(itemname)) hoveritem.value = itemname;
  }

  isActive(String itemname) => activeitem.value == itemname;

  isHovering(String itemname) => hoveritem.value == itemname;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case RecordPageRoute:
        return _customIcon(Icons.receipt, itemName);
      case PrescriptionsPageRoute:
        return _customIcon(FontAwesomeIcons.fileMedical, itemName);
      case AppointmentsPageRoute:
        return _customIcon(FontAwesomeIcons.peopleGroup, itemName);
      case PredictionsPageRoute:
        return _customIcon(FontAwesomeIcons.robot, itemName);
      case RequestsPageRoute:
        return _customIcon(FontAwesomeIcons.hospital, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
