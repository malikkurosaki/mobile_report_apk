import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect.dart';
import 'package:mobile_report/Val.dart';
import 'package:http/http.dart' as http;

class Conn {
  // static const url = "http://188.166.218.138:3000/api";
  static const url = "http://10.0.2.2:3000/api";

  Future<http.Response> dashBoard() {
    final _url = Uri.parse(url+"/display/dash?tgl1=${Val.tgl1.toString().split(" ")[0]}&tgl2=${Val.tgl2.toString().split(" ")[0]}&out=${Val.out.value.kodeOut}&dep=${Val.dep.value.namaDept}");
    return http.get(_url);
  }
  // Future<Response> dashBoard() => get(url+"/display/dash?tgl1=${Val.tgl1}&tgl2=${Val.tgl2}&out=${Val.out.value.kodeOut}&dep=${Val.dep.value.namaDept}", );
  Future<http.Response> masterDep() => http.get(Uri.parse(url+'/master/dep'));
  Future<http.Response> masterOut() => http.get(Uri.parse(url+'/master/out'));
}