import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/style.dart';

/// Example without datasource
class PrescriptionsTableLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText(
                text: "Prescriptions History",
                color: lightGrey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Row(
                    children: [
                      Text("Name"),
                    ],
                  ),
                  tooltip: 'Prescription Name Name',
                  size: ColumnSize.S,
                ),
                DataColumn2(
                    tooltip: 'Doctor Added By',
                    label: Text('Added By'),
                    size: ColumnSize.S),
                DataColumn2(label: Text('Date Added'), size: ColumnSize.S),
                DataColumn2(label: Text('Description'), size: ColumnSize.L),
              ],
              rows: List<DataRow>.generate(
                  7,
                  (index) => DataRow(cells: [
                        DataCell(CustomText(text: "Presc $index")),
                        DataCell(CustomText(text: "Dr.Iyad Akawi")),
                        DataCell(CustomText(
                          text: "5/10/2022",
                        )),
                        DataCell(Text(
                          "Veniam nisi deserunt tempor aute eD,JFNHREJKFHRKERLIJFREJKWUh  kuhKHFKUHERUFHRDKSUFHRSUKFHSKDJFHSKJFHSDKUDFHSUKH iusmod occaecat laboris eiusmod labore minim sint adipisicing. Do aliquip officia minim elit. Consequat ea culpa culpa eiusmod.",
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 2,
                        )),
                      ]))),
        ],
      ),
    );
  }
}
