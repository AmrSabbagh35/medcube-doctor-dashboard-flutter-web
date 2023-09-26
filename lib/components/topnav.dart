import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/style.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';

AppBar buildAppBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(FontAwesomeIcons.houseMedical)),
            ],
          )
        : IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              key.currentState?.openDrawer();
            }),
    title: Container(
      child: Row(
        children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: CustomText(
                text: "Med-Cube Doctors",
                color: Colors.white,
                size: 20,
                weight: FontWeight.w400,
              )),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: dark,
              ),
              onPressed: () {}),
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: dark.withOpacity(.7),
                  ),
                  onPressed: () {}),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2)),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 1,
            height: 22,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          CustomText(
            text: "Dr.Iyad Akawi",
            color: Colors.white,
            weight: FontWeight.bold,
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.5),
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.teal,
  );
}
