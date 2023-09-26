import 'package:flutter/material.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/helpers/reponsiveness.dart';
import 'package:medsquare_web/pages/predictions/widgets/buildPredictCard.dart';

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  if (ResponsiveWidget.isLargeScreen(context))
                    PredictionsCategories()
               
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
