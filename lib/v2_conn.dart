import 'package:get/get_connect.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/v2_models.dart';
import 'package:mobile_report/v2_pref.dart';
import 'package:mobile_report/v2_val.dart';

class V2Conn extends GetConnect{
  // final url = Ambil<V2ModelConfig>().data(V2Pref.config().get()).dev!? Ambil<V2ModelConfig>().data(V2Pref.config().get()).urlDev: Ambil<V2ModelConfig>().data(V2Pref.config().get()).url;
  final url = V2Val.config.value.dev!? V2Val.config.value.urlDev: V2Val.config.value.url;
  getPropertyDashBoard(String title) => '$title?tgl1=${V2Val.tanggal1.value}&tgl2=${V2Val.tanggal2.value}&out=${V2Val.out.value.kodeOut}&dep=${V2Val.dep.value.namaDept}&query=true';

  Future<Response> getFood() => get(url!+'/'+getPropertyDashBoard("food"));
  Future<Response> beverage() => get(url!+'/'+getPropertyDashBoard("beverage"));
  Future<Response> other() => get(url!+'/'+getPropertyDashBoard("other"));


  Future<Response> masterDep() => get(url!+'/masterDep');
  Future<Response> masterOut() => get(url!+'/masterOut');

  Future<Response> login(Map<String, dynamic> body) => post(url!+'/login', body);
  Future<Response> totalRevenue() => get(url!+'/'+getPropertyDashBoard("totalRevenue"));

  Future<Response> salesPerformanceWeek() => get(url!+'/salesPerformanceWeek?date='+V2Val.tanggal1.toString());
  Future<Response> salesPerformanceMonth() => get(url!+'/salesPerformanceMonth?date='+V2Val.tanggal1.toString());

}