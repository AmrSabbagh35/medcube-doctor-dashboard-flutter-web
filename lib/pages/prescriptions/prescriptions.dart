import 'package:flutter/material.dart';
import 'package:medsquare_web/components/custom_dialog.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';
import 'package:medsquare_web/pages/prescriptions/widgets/add_prescription_table_large.dart';
import 'package:medsquare_web/pages/prescriptions/widgets/add_prescription_table_small.dart';
import 'package:medsquare_web/pages/prescriptions/widgets/presc_history_table_large.dart';
import 'package:medsquare_web/pages/prescriptions/widgets/presc_history_table_small.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  if (!ResponsiveWidget.isSmallScreen(context))
                    PrescriptionsTableLarge()
                  else
                    PrescriptionsTableSmall(),
                  if (!ResponsiveWidget.isSmallScreen(context))
                    AddPrescTableLarge()
                  else
                    AddPrescTableSmall(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
