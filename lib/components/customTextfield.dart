import 'package:flutter/material.dart';
import 'package:medsquare_web/constants/style.dart';

class CustomTextFeild extends StatelessWidget {
final TextEditingController c;

  const CustomTextFeild({Key? key,required this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:30,
      width: 150,
      child: TextFormField(
        controller: c,
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: lightGrey),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
