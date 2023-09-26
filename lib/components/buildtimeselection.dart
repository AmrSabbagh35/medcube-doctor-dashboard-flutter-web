import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medsquare_web/constants/sizes.dart';

class TimeSelection extends StatefulWidget {
  const TimeSelection({Key? key}) : super(key: key);

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool datepicked = false;
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        datepicked = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        datepicked
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal[300]),
                    child: Text(
                        '${selectedTime.hour}:${selectedTime.minute}',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    width: sw * 0.2,
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Text('Edit',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        )),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
                child: Text('Select Time')),
      ],
    );
  }
}
