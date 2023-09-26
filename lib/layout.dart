import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medsquare_web/components/largescreen.dart';
import 'package:medsquare_web/components/side_menu.dart';
import 'package:medsquare_web/components/smallscreen.dart';
import 'package:medsquare_web/components/topnav.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      extendBodyBehindAppBar: true,
      appBar:  buildAppBar(context, scaffoldkey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: LargeScreen(),
      ),
    );
  }
}
