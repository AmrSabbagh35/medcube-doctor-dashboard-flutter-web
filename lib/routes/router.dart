import 'package:flutter/material.dart';
import 'package:medsquare_web/pages/appointments/appointments.dart';
import 'package:medsquare_web/pages/predictions/predictions.dart';
import 'package:medsquare_web/pages/prescriptions/prescriptions.dart';
import 'package:medsquare_web/pages/record/record.dart';
import 'package:medsquare_web/routes/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RecordPageRoute:
      return _getPageRoute(RecordPage());
    case PrescriptionsPageRoute:
      return _getPageRoute(PrescriptionPage());
    case AppointmentsPageRoute:
      return _getPageRoute(AppointmentsPage());
    case PredictionsPageRoute:
      return _getPageRoute(PredictionsPage());
    case RequestsPageRoute:
      return _getPageRoute(PredictionsPage());
    default:
      return _getPageRoute(RecordPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
