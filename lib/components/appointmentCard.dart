import 'package:flutter/material.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/sizes.dart';
import 'package:medsquare_web/constants/style.dart';

class AppointmentCard extends StatelessWidget {
  final VoidCallback callback;
  final String name;
  final String date;
  final String time;
  final String desc;

  const AppointmentCard(
      {Key? key,
      required this.callback,
      required this.name,
      required this.time,
      required this.date,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
              width: 350,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: active.withOpacity(.4), width: .5),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 6),
                      color: lightGrey.withOpacity(.1),
                      blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomText(
                        text: name,
                        weight: FontWeight.w400,
                        size: 20,
                      )),
                  Divider(),
                  buildField(
                      context: context,
                      icon: Icons.date_range,
                      title: 'Date : ',
                      content: date),
                  buildField(
                      context: context,
                      icon: Icons.timelapse,
                      title: 'Time : ',
                      content: time),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Colors.teal,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        Text('Main Complainment :'),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            width: sw * 0.8,
                            child: Text(
                              desc,
                              textAlign: TextAlign.left,
                              maxLines: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.teal[300],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10))),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                              child: Icon(
                                Icons.do_not_disturb_alt_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildField({context, icon, title, content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.006,
          ),
          Text(title),
          Container(
            width: 200,
            child: Text(
              content,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
