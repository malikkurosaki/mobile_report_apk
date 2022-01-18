import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/app/home.dart';
import 'package:mobile_report/intro.dart';
import 'package:mobile_report/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    onLoad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/splash3.png'),
          ),
        ),
        child: Stack(
          children: [
            // Container(
            //   width: double.infinity,
            //   height: double.infinity,
            //   color: Colors.black38,
            // ),
            Center(
              child: Text(
                "MOBILE\rREPORT",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: Center(
                child: Text("by Probus System"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onLoad() async {

    print(Pref.isIntro().get());
    await 3.delay();

    if (Pref.isIntro().get()??true) {
      Get.off(Intro());
      return;
    }

    if (Pref.isLogin().get()??true) {
      Get.off(Login());
      return;
    }

    Get.off(Home());
  }
}
