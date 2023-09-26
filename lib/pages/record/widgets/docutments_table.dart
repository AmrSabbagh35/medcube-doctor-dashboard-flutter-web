import 'package:flutter/material.dart';
import 'package:medsquare_web/constants/style.dart';

class DocumentsTableLarge extends StatelessWidget {
  const DocumentsTableLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: Container(
        width: 300,
        height: 400,
        child: GridView.builder(
          // physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            mainAxisExtent: 230,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 300,
              height: 350,
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
