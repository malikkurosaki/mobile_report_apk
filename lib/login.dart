import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/splash.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final conUserName = TextEditingController();
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
                      child: Text("Enter the username and password that you have previously, to proceed to the next process",
                        style: TextStyle(
                          color: Colors.grey[700]
                        ),
                      )
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        controller: conUserName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            hintText: "username"),
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
                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                  onPressed: (){
                    Pref.isLogin().set(false);
                    Get.off(Splash());
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
