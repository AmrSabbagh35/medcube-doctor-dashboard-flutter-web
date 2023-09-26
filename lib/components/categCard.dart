import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medsquare_web/constants/sizes.dart';
import 'package:medsquare_web/constants/style.dart';

class CategCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback callback;

  const CategCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.white),
            SizedBox(
              height: sh * 0.02,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
