import 'package:flutter/material.dart';
import 'package:medsquare_web/pages/record/widgets/info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Name",
              value: "John Doe",
              topColor: Colors.redAccent,
              onTap: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Insurance Member",
              value: "Yes",
              onTap: () {},
              topColor: Colors.green,
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            InfoCard(
              title: "ID",
              value: "203-358-732",
              topColor: Colors.yellow,
              onTap: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Scheduled",
              value: "10/3/2022",
              onTap: () {},
              topColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
