import 'package:flutter/material.dart';
import 'package:medsquare_web/components/side_menu.dart';
import 'package:medsquare_web/helpers/local_navigator.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.white,
          child: SideMenu(),
        )),
        Expanded(flex: 5, child: localNavigator()),
      ],
    );
  }
}
