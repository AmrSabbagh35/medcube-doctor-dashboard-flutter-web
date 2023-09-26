import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/components/addHospitalRequest.dart';
import 'package:medsquare_web/components/addNewMedicalRecord.dart';
import 'package:medsquare_web/components/customTextfield.dart';
import 'package:medsquare_web/components/custom_dialog.dart';
import 'package:medsquare_web/components/requestNewTest.dart';

class BuildFAB extends StatelessWidget {
  const BuildFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        icon: Icons.menu,
        backgroundColor: Colors.teal,
        activeChild: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        spacing: 10,
        children: [
          SpeedDialChild(
            label: 'Request a test',
            backgroundColor: Colors.teal[800],
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                      callback: () {
                        Navigator.pop(context);
                        Get.snackbar(
                            'Requested !', 'Test Request has been sent');
                      },
                      child: RequestNewTest(),
                      title: 'Request a test',
                      buttontext: 'Confirm'));
            },
            child: Icon(Icons.document_scanner, color: Colors.white),
          ),
          SpeedDialChild(
            label: 'Add New Medical Record',
            backgroundColor: Colors.teal[800],
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                      callback: () {
                        Navigator.pop(context);
                        Get.snackbar(
                            'Added !', 'Medical Record has been added');
                      },
                      child: AddNewMedical(),
                      title: 'Add a Medical Record',
                      buttontext: 'Confirm'));
            },
            child: Icon(Icons.medical_services, color: Colors.white),
          ),
          SpeedDialChild(
            label: 'Request a hospital Reservation',
            backgroundColor: Colors.teal[800],
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                      callback: () {
                        Navigator.pop(context);
                        Get.snackbar(
                            'Reserved !', 'Hospital Reservation has been sent');
                      },
                      child: AddHosptialRequest(),
                      title: 'Request a Hospital Reservation',
                      buttontext: 'Confirm'));
            },
            child: Icon(FontAwesomeIcons.hospital, color: Colors.white),
          ),
        ]);
  }
}
