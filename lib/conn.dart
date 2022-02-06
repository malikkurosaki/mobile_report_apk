import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect.dart';
import 'package:mobile_report/Val.dart';
import 'package:http/http.dart' as http;

class Conn {
  // static const url = "http://188.166.218.138:3000/api";
  // static const url = "http://10.0.2.2:3000/api";
  static get url => Val.config.dev!? Val.config.urlDev: Val.config.url;
  urlPath(String path) => Uri.parse(url+"/display/$path?tgl1=${Val.tgl1.toString().split(" ")[0]}&tgl2=${Val.tgl2.toString().split(" ")[0]}&out=${Val.out.value.kodeOut}&dep=${Val.dep.value.namaDept}");

  Future<http.Response> dashBoard() => http.get(urlPath('dash'));
  Future<http.Response> totalRevenue() => http.get(urlPath('totalRevenue'));
  Future<http.Response> avarageBillPax() => http.get(urlPath('avarageBillPax'));
  Future<http.Response> complimentGross() => http.get(urlPath('complimentGross'));
  Future<http.Response> salesPerformance() => http.get(urlPath('salesPerformance'));
  Future<http.Response> salesAvarage () => http.get(urlPath('salesAvarage'));

  
  // Future<Response> dashBoard() => get(url+"/display/dash?tgl1=${Val.tgl1}&tgl2=${Val.tgl2}&out=${Val.out.value.kodeOut}&dep=${Val.dep.value.namaDept}", );
  Future<http.Response> masterDep() => http.get(Uri.parse(url+'/master/dep'));
  Future<http.Response> masterOut() => http.get(Uri.parse(url+'/master/out'));

  Future<http.Response> login(Map body) => http.post(Uri.parse(url+'/login'), body: body);


}