import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/constants/sizes.dart';

class TestCard extends StatelessWidget {
  final String docname;
  final String analysisname;
  final String date;

  const TestCard(
      {Key? key,
      required this.docname,
      required this.analysisname,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 3,
        child: Container(
          width: double.infinity,
          height: sh * 0.24,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildField(
                        title: 'Submitted:',
                        content: docname,
                        context: context),
                    SizedBox(
                      height: sh * 0.01,
                    ),
                    buildField(
                        title: 'Analysis Name:',
                        content: analysisname,
                        context: context),
                    SizedBox(
                      height: sh * 0.01,
                    ),
                    buildField(title: 'Date:', content: date, context: context),
                    SizedBox(
                      height: sh * 0.01,
                    ),
                  ],
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Get.snackbar('Downloading ..', '2%');
                },
                elevation: 2.0,
                fillColor: Colors.teal,
                child: Icon(
                  Icons.download,
                  color: Colors.white,
                  size: 30.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildField({context, title, content}) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          width: sw * 0.02,
        ),
        Text(
          content,
          style: TextStyle(fontSize: sh * 0.022),
        ),
      ],
    );
  }
}
