import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_report/models.dart';
import 'package:mobile_report/v2_conn.dart';
import 'package:mobile_report/v2_models.dart';
import 'package:mobile_report/v2_pref.dart';
import 'package:mobile_report/v2_splash.dart';
import 'package:mobile_report/v2_val.dart';
import 'v2_error_log.dart';

class V2Util {
  V2Util();

  V2Util.init() {
    load();
  }

  load() async {
    EasyLoading.showInfo("load data ..");
    // await loadMasterDep();
    // await loadMasterOut();
    await loadFood();
    await loadBeverage();
    await loadOther();
    await loadToalRevenue();
    await loadSalesPerformanceWeek();
    await loadSalesPerformanceMonth();
    
  }

  Future loadFood() async {
    try {
      final res = await V2Conn().getFood();
      V2Val.food.value = V2ModelFood.fromJson(res.body);

      // print(res.body);
    } catch (e) {
      ErrorLog().create("V2Util:laodFood", e.toString());
    }
  }

  Future loadBeverage() async {
    try {
      final res = await V2Conn().beverage();
      V2Val.beverage.value = V2ModelFood.fromJson(res.body);

      // print(res.body);
    } catch (e) {
      ErrorLog().create("V2Util:laodFood", e.toString());
    }
  }

  Future loadOther() async {
    try {
      final res = await V2Conn().other();
      V2Val.other.value = V2ModelFood.fromJson(res.body);

      // print(res.body);
    } catch (e) {
      ErrorLog().create("V2Util:laodFood", e.toString());
    }
  }

  Future<void> loadMasterDep() async {
    try {
      final res = await V2Conn().masterDep();
      final data = List.from(res.body).map((e) => V2ModelDep.fromJson(e));
      V2Val.masterDep.assignAll(data);

    } catch (e) {
      EasyLoading.showError("V2Uti:loadMasterDep");
    }
  }

  Future<void> loadMasterOut() async {
    final res = await V2Conn().masterOut();
    final data = List.from(res.body).map((e) => V2ModelOut.fromJson(e)).toList();
    V2Val.masterOut.assignAll(data);

  }

  Future login(Map<String, dynamic> body)async {
    try {
      final data = await V2Conn().login(body); 
      if(data.body['success']){
        V2Val.user.value = V2ModelUser.fromJson(data.body['data']);
        V2Pref.user().set(data.body);
        Get.offAll(V2Splash());
      
      }else{
        EasyLoading.showError(data.body['message']);
      }
      
    } catch (e) {
      ErrorLog().create("V2util:login", e.toString());
    }
  }

  Future? updateOption({required DateTime tanggal1,required DateTime tanggal2, required V2ModelDep dep, required V2ModelOut out}){
    print("ini dimana");
  }

  Future loadToalRevenue()async{
    try {
      final data = await V2Conn().totalRevenue();
      V2Val.totalRevenue.value = V2ModelTotalRevenue.fromJson(data.body);

    } catch (e) {
      EasyLoading.showToast("err:v2util:loadtotalrevenue");
    }
    
  }

  Future loadSalesPerformanceWeek()async{
    try {
      final data = await V2Conn().salesPerformanceWeek();
      V2Val.salesPerformanceWeek.value = V2ModelSalesPerformanceWeek.fromJson(data.body);
    } catch (e) {
      throw ErrorLog();
    }
  }

  Future loadSalesPerformanceMonth()async{
    try {
      final data = await V2Conn().salesPerformanceMonth();
      V2Val.salesPerformanceMonth.value = V2ModelSalesPerformanceWeek.fromJson(data.body);
    } catch (e) {
      throw ErrorLog();
    }
  }

}
