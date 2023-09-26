import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medsquare_web/constants/style.dart';
import 'package:medsquare_web/pages/login/login_page_left_side.dart';
import 'package:medsquare_web/pages/login/login_page_right_side.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 640,
            width: 1080,
            margin: EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 6),
                    color: lightGrey.withOpacity(.5),
                    blurRadius: 12)
              ],
            ),
            child: Row(
              children: [
                const LoginPageLeftSide(),
                if (MediaQuery.of(context).size.width > 900)
                  const LoginPageRightSide(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
