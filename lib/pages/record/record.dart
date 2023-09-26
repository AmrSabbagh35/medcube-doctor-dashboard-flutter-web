import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/components/FAB.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/components/operationCard.dart';
import 'package:medsquare_web/constants/controllers.dart';
import 'package:medsquare_web/constants/style.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';
import 'package:medsquare_web/pages/prescriptions/widgets/presc_history_table_large.dart';
import 'package:medsquare_web/pages/record/widgets/disease_history_table.dart';
import 'package:medsquare_web/pages/record/widgets/docutments_table.dart';
import 'package:medsquare_web/pages/record/widgets/general_information_large.dart';
import 'package:medsquare_web/pages/record/widgets/medical_record_small.dart';
import 'package:medsquare_web/pages/record/widgets/overview_cards_large.dart';
import 'package:medsquare_web/pages/record/widgets/overview_cards_medium.dart';
import 'package:medsquare_web/pages/record/widgets/overview_cards_small.dart';
import 'package:medsquare_web/pages/record/widgets/medical_record_large.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: BuildFAB(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Container(
          child: Column(children: [
            Expanded(
              child: ListView(
                children: [
                  if (ResponsiveWidget.isLargeScreen(context) ||
                      ResponsiveWidget.isMediumScreen(context))
                    if (ResponsiveWidget.isCustomSize(context))
                      OverviewCardsMediumScreen()
                    else
                      OverviewCardsLargeScreen()
                  else
                    OverviewCardsSmallScreen(),
                  if (!ResponsiveWidget.isSmallScreen(context))
                    MedicalRecordLarge()
                  else
                    MedicalRecordSmall(),
                  GeneralInformationLarge()
                  // DocumentsTableLarge(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
