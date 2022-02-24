import 'package:get/get_connect.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/v2_models.dart';
import 'package:mobile_report/v2_pref.dart';
import 'package:mobile_report/v2_val.dart';

import 'config.dart';

class V2Conn extends GetConnect{
  // final url = Ambil<V2ModelConfig>().data(V2Pref.config().get()).dev!? Ambil<V2ModelConfig>().data(V2Pref.config().get()).urlDev: Ambil<V2ModelConfig>().data(V2Pref.config().get()).url;
  // final url = V2Val.config.value.dev!? V2Val.config.value.urlDev: V2Val.config.value.url;
  getPropertyDashBoard(String title) => '$title?tgl1=${V2Val.tanggal1.value}&tgl2=${V2Val.tanggal2.value}&out=${V2Val.out.value.kodeOut}&dep=${V2Val.dep.value.namaDept}&query=true';

  Future<Response> getFood() => get(Config.getUrl+'/'+getPropertyDashBoard("food"));
  Future<Response> beverage() => get(Config.getUrl+'/'+getPropertyDashBoard("beverage"));
  Future<Response> other() => get(Config.getUrl+'/'+getPropertyDashBoard("other"));

  Future<Response> top10Food() => get(Config.getUrl+'/'+getPropertyDashBoard("top10Food"));
  Future<Response> top10Beverage() => get(Config.getUrl+'/'+getPropertyDashBoard("top10Beverage"));
  Future<Response> top10Other() => get(Config.getUrl+'/'+getPropertyDashBoard("top10Other"));

  Future<Response> masterDep() => get(Config.getUrl+'/masterDep');
  Future<Response> masterOut() => get(Config.getUrl+'/masterOut');
  Future<Response> listUser() => get(Config.getUrl+'/listUser');

  Future<Response> login(Map<String, dynamic> body) => post(Config.getUrl+'/login', body);
  Future<Response> totalRevenue() => get(Config.getUrl+'/'+getPropertyDashBoard("totalRevenue"));

  Future<Response> salesPerformanceWeek() => get(Config.getUrl+'/salesPerformanceWeek?date='+V2Val.tanggal1.toString());
  Future<Response> salesPerformanceMonth() => get(Config.getUrl+'/salesPerformanceMonth?date='+V2Val.tanggal1.toString());

  Future<Response> register(Map<String, dynamic> body) => post(Config.getUrl+'/register', body);


}