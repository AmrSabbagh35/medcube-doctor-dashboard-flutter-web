import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medsquare_web/constants/sizes.dart';

class DateSelection extends StatefulWidget {
  const DateSelection({Key? key}) : super(key: key);

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  DateTime selectedDate = DateTime.now();
  bool datepicked = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        datepicked = true;
      });
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
                    child: Text('${DateFormat.yMd().format(selectedDate)}',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    width: sw * 0.2,
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
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
                child: Text('Select Date',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () => _selectDate(context),
              ),
      ],
    );
  }
}
