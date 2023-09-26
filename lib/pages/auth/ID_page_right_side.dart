import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/layout.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class IDPageRightSide extends StatelessWidget {
  const IDPageRightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaskedTextController _controller =
        MaskedTextController(mask: '000 - 000 - 000');

    return Expanded(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Your Patient ID",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "To Fetch his data and show it to your screen.!",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _controller,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {},
              decoration: InputDecoration(
                  label: Text("ID"), hintText: "Please Enter your ID"),
            ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Get.off(SiteLayout(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: Text("Go"),
              minWidth: double.infinity,
              height: 52,
              elevation: 24,
              color: Colors.teal.shade700,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            )
          ],
        ),
      ),
    ));
  }
}
