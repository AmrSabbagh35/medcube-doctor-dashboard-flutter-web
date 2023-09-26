import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddNewMedical extends StatefulWidget {
  @override
  State<AddNewMedical> createState() => _AddNewMedicalState();
}

class _AddNewMedicalState extends State<AddNewMedical> {
  final List<String> items = [
    'Type1',
    'Type2',
    'Type3',
    'Type4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(title: 'Name'),
            SizedBox(
              height: 10,
            ),
            Text('Type'),
            SizedBox(
              height: 10,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  'Select a type',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 300,
                itemHeight: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildTextField(title: 'Description', lines: 4)
          ],
        ),
      ),
    );
  }

  buildTextField({title, lines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: lines,
          style: TextStyle(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
              focusColor: Colors.black,
              hintText: title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintStyle: TextStyle(color: Colors.black38, fontSize: 15)),
        ),
      ],
    );
  }
}
