import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final String title;
  final String buttontext;
  final VoidCallback callback;

  const CustomDialog(
      {Key? key,
      required this.child,
      required this.callback,
      required this.title,
      required this.buttontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(title),
      content: SingleChildScrollView(child: child),
      actions: <Widget>[
        Container(
          color: Colors.teal,
          child: TextButton(
            child: Text(
              buttontext,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: callback,
          ),
        ),
      ],
    );
  }
}
