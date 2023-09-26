import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/controllers/menuController.dart';

import 'package:medsquare_web/controllers/navigation_controller.dart';
import 'package:medsquare_web/pages/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CustomMenuController());
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedSquare Web',
      // theme: ThemeData(
      //   textTheme: GoogleFonts.openSansTextTheme(
      //     Theme.of(context).textTheme,
      //   ).apply(
      //     bodyColor: Colors.black,
      //   ),
      //   primaryColor: Colors.teal[400],
      // ),
      home: LoginPage(),
    );
  }
}
