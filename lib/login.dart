import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/conn.dart';
import 'package:mobile_report/splash.dart';
import 'package:mobile_report/v2_conn.dart';
import 'package:mobile_report/v2_error_log.dart';
import 'package:mobile_report/v2_models.dart';
import 'package:mobile_report/v2_pref.dart';
import 'package:mobile_report/v2_splash.dart';
import 'package:mobile_report/v2_util.dart';

import 'pref.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final conEmail = TextEditingController();
  final conPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: Get.height / 20,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Login Mobile Report",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          "Enter the email and password that you have previously, to proceed to the next process",
                          style: TextStyle(color: Colors.grey[700]),
                        )),
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        controller: conEmail,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            hintText: "email"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        controller: conPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            hintText: "password"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  onPressed: () async {
                    try {
                      final body = {
                        "email": conEmail.text,
                        "password": conPassword.text
                      };

                      final cek = body.values;
                      if(cek.contains("")){
                        EasyLoading.showError("please not empty event of one filed");
                        return;
                      }

                      await V2Util().login(body);
                      
                      // final lgn = await V2Conn().login(body);
                      // print(lgn);

                      // if(lgn.body['success']){
                      //   V2Pref.user().set(V2ModelUser.fromJson(lgn.body['data']));
                      //   Get.offAll(V2Splash());

                      // }else{
                      //   EasyLoading.showError(lgn.body['message']);
                      // }
                      
                    } catch (e) {
                      ErrorLog().create("login:onlogin", e.toString());
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
