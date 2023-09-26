import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsquare_web/components/custom_dialog.dart';
import 'package:medsquare_web/layout.dart';
import 'package:medsquare_web/pages/auth/id_enter.dart';

class LoginPageLeftSide extends StatelessWidget {
  const LoginPageLeftSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phonenumber = TextEditingController();
    TextEditingController password = TextEditingController();
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
              "MedCube",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Engineer Your Way to Healthcare. !",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: phonenumber,
              decoration: InputDecoration(
                  label: Text("phone"), hintText: "Please write your phone"),
            ),
            TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  label: Text("password"),
                  hintText: "Please write your password"),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                child: const Text("Forget password?"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                          callback: () {},
                          child: Text(
                              'Contact us to confirm identitiy and retreive your account !\n\ncall +96397372873'),
                          title: 'Forgot Password?',
                          buttontext: 'ok'));
                },
              ),
            ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Get.off(EnterIDPage(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: Text("Login"),
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
