import 'package:flutter/material.dart';

class RequestNewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController c1 = TextEditingController();
    final TextEditingController c2 = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Analysis Type'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: c1,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  hintText: 'Analysis Type',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 15)),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Notes'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: c2,
              maxLines: 5,
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  hintText: 'Notes',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
