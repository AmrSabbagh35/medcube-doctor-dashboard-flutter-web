import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medsquare_web/components/custom_dialog.dart';
import 'package:medsquare_web/helpers/sharedApi.dart';
import 'package:medsquare_web/models/login.dart';

class AuthController extends GetxController {
  var token;
  Future<void> login(
      String phonenumber, String password, BuildContext context) async {
    var url = "http://${Shared.baseUrl}/api/login";
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(
            {
              'phone_number': phonenumber,
              'password': password,
            },
          ),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'skip-encryption': '1',
          });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        LoginData loginData = LoginData.fromJson(responseData["data"]);
        if (loginData.status == 'Pending')
          showDialog(
              context: context,
              builder: (context) => CustomDialog(
                callback: (){
                  
                },
                  child: Text('Account not activated yet'),
                  title: 'Not Activated',
                  buttontext: 'OK'));
        else
          token = loginData.token;
      }
    } catch (err) {
      print(err);
    }
  }
}
