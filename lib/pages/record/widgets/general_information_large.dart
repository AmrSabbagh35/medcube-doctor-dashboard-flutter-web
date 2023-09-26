import 'package:flutter/material.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/components/operationCard.dart';
import 'package:medsquare_web/components/testCard.dart';
import 'package:medsquare_web/constants/style.dart';

class GeneralInformationLarge extends StatelessWidget {
  const GeneralInformationLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: CustomText(
                  text: "General Information",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark.withOpacity(0.8),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: sh * 0.05,
          // ),
          buildHeader(sw, sh, 'Main Complainment'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomText(
              text:
                  'Reprehenderit sit reprehenderit nulla tempor consectetur ad amet duis et enim et. Nostrud et reprehenderit esse ex sunt id non dolor et in ex. Adipisicing laboris anim qui adipisicing magna Lorem do quis amet minim consequat. Nulla veniam elit incididunt qui magna qui velit laborum elit duis in aliqua cupidatat exercitation. Veniam ad duis esse dolor est irure cillum velit consequat elit amet Lorem fugiat duis. Do laboris consectetur aliqua cillum.Mollit incididunt esse consectetur dolor. Ullamco culpa ipsum incididunt occaecat. Reprehenderit ad anim id est duis est nostrud minim. Amet consectetur enim sint magna aliqua tempor nulla occaecat deserunt nulla officia. Aute reprehenderit laborum incididunt ad cillum minim.',
              size: 20,
            ),
          ),
          buildHeader(sw, sh, 'Recent Operations'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: sh * 0.05,
                crossAxisSpacing: sw * 0.05,
                crossAxisCount: 3,
                mainAxisExtent: 150,
              ),
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return OperationCard();
              },
            ),
          ),
          buildHeader(sw, sh, 'Recent Analysis Results'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: sh * 0.05,
                crossAxisSpacing: sw * 0.05,
                crossAxisCount: 3,
                mainAxisExtent: 150,
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return TestCard(
                  date: '20/10/2022',
                  analysisname: 'Blood test',
                  docname: 'Dr.Sara Kassar',
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  Container buildHeader(double sw, double sh, String title) {
    return Container(
      width: sw * 0.2,
      height: sh * 0.05,
      decoration: BoxDecoration(
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: CustomText(
        text: '$title :',
        color: Colors.white,
        size: 20,
        overflow: true,
        weight: FontWeight.bold,
      ),
    );
  }
}
