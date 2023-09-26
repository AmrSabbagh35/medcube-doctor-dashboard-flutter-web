import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:medsquare_web/components/builddateselection.dart';
import 'package:medsquare_web/components/buildtimeselection.dart';

class AddHosptialRequest extends StatefulWidget {
  @override
  State<AddHosptialRequest> createState() => _AddHosptialRequestState();
}

class _AddHosptialRequestState extends State<AddHosptialRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date'),
            SizedBox(
              height: 10,
            ),
            DateSelection(),
            SizedBox(
              height: 10,
            ),
            Text('Time'),
            SizedBox(
              height: 10,
            ),
            TimeSelection(),
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
