import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_report/app/home.dart';
import 'package:mobile_report/app/v2_dashboard_option.dart';
import 'package:mobile_report/app/v2_home.dart';
import 'package:mobile_report/intro.dart';
import 'package:mobile_report/login.dart';
import 'package:mobile_report/v2_root.dart';

class MyRouter {
  late String _key;

  MyRouter.home() : _key = '/home';
  MyRouter.login() : _key = '/login';
  MyRouter.register() : _key = '/register';
  MyRouter.root() : _key = '/';
  MyRouter.intro() : _key = '/intro';
  MyRouter.dashboardOptions() : _key = '/dashboardOptions';

  String get key => _key;
  set key(String value) => _key = value;

  go() {
    Get.toNamed(key);
  }

  goOff() {
    Get.offNamed(key);
  }

  static final listPage = [
    GetPage(name: MyRouter.root().key, page: () => V2Root()),
    GetPage(name: MyRouter.home().key, page: () => V2Home()),
    GetPage(name: MyRouter.login().key, page: () => Login()),
    GetPage(name: MyRouter.intro().key, page: () => Intro()),
    GetPage(name: MyRouter.dashboardOptions().key, page: () => V2DashboardOption(),)
  ];
}
