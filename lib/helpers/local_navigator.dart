import 'package:flutter/cupertino.dart';
import 'package:medsquare_web/constants/controllers.dart';
import 'package:medsquare_web/routes/router.dart';
import 'package:medsquare_web/routes/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      initialRoute: RecordPageRoute,
      onGenerateRoute: generateRoute,
    );
