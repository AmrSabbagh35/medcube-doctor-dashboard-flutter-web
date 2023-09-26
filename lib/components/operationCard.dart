import 'package:flutter/material.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/style.dart';

class OperationCard extends StatelessWidget {
  const OperationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.of(context).size.height;
    var sw = MediaQuery.of(context).size.width;
    return Container(
      width: sw * 0.22,
      height: sh * 0.25,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.2),
              blurRadius: 12)
        ],
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Appendicitis',
                      color: Colors.black,
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                buildField(
                    field: 'Doctor Name', content: 'Dr.Mohammad Hammoud'),
                buildField(field: 'Date', content: '23/11/2021'),
                buildField(field: 'Hospital Name', content: 'Al-Shami'),
              ],
            ),
          ),
          Positioned(
              right: -70,
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.teal.withOpacity(0.1),
              )),
        ],
      ),
    );
  }

  Widget buildField({field, content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$field :',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            content,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
