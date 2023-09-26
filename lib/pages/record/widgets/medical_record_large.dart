import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medsquare_web/components/custom_dialog.dart';
import 'package:medsquare_web/components/custom_text.dart';
import 'package:medsquare_web/constants/style.dart';

class MedicalRecordLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildPersonalinfo(),
        buildMedicalRecord(context),
      ],
    );
  }

  Expanded buildMedicalRecord(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 30),
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
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomText(
                text: "Medical Record",
                size: 20,
                weight: FontWeight.bold,
                color: dark.withOpacity(0.8),
              ),
            ),
            buildRecordCard(
                context, 'Heart Diseases', FontAwesomeIcons.heartPulse),
            buildRecordCard(
                context, 'Nerological Diseases', FontAwesomeIcons.handBackFist),
            buildRecordCard(
                context, 'Genatic Diseases', FontAwesomeIcons.child),
            buildRecordCard(
                context, 'Digestive Diseases', FontAwesomeIcons.hamburger),
          ],
        ),
      ),
    );
  }

  Widget buildRecordCard(BuildContext context, text, icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
        ),
        child: ListTile(
          onTap: () async {
            showMyDialog(context);
          },
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 25,
          ),
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          // children: <Widget>[
          //   Divider(
          //     thickness: 0.5,
          //   ),
          //   GestureDetector(
          //     onTap: () {},
          //     child: ListTile(
          //       title: Text('Disease 1'),
          //       subtitle: Text(
          //         '12/2/2022',
          //       ),
          //       trailing: Icon(Icons.arrow_forward_ios),
          //     ),
          //   ),
          //   ListTile(
          //     title: Text('Disease 2'),
          //     subtitle: Text('23/7/2022'),
          //     trailing: Icon(Icons.arrow_forward_ios),
          //   ),
          // ],
        ),
      ),
    );
  }

  showMyDialog(context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialog(
          callback: () {
            Navigator.pop(context);
          },
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: 'Coronary Artery Disease',
                          buttontext: 'Back',
                          callback: () {
                            Navigator.pop(context);
                          },
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            buildField(
                                field: 'Added By',
                                content: 'Dr.Rawan Mousilli'),
                            buildField(field: 'Date Added', content: '1/4/2020'),
                            buildField(field: 'Description', content: 'Description'),
                          ]),
                        );
                      });
                  // return CustomDialog(title: 'Coronary Artery Disease',buttontext: 'Confirm',callback: (){},child: Column(mainAxisSize: MainAxisSize.min,),);
                },
                child: ListTile(
                    title: Text('Coronary Artery Disease'),
                    subtitle: Text('10/20/2022')),
              ),
            ],
          ),
          buttontext: 'Back',
          title: 'Heart Diseases',
        );
      },
    );
  }

  Widget buildPersonalinfo() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 30),
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
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomText(
                  text: "Personal Information",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark.withOpacity(0.8),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildField(field: 'First Name', content: 'John'),
                  buildField(field: 'Middle Name', content: 'Smith'),
                  buildField(field: 'Last Name', content: 'Doe'),
                  buildField(field: 'Age', content: '30'),
                  buildField(field: 'Location', content: 'Al-Malki'),
                  buildField(field: 'Weight', content: '65 kg'),
                  buildField(field: 'Height', content: '182 cm'),
                  buildField(field: 'Date of Birth', content: '14/5/1992'),
                  buildField(field: 'Blood Type', content: 'B+'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({field, content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$field :',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: dark),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            content,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
