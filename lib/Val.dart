import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_report/models.dart';

import 'conn.dart';

class Val {
  static final dashboard = ModelDashboard().obs;
  static final tgl1 = "".obs;
  static final tgl2 = "".obs;
  static final dep = ModelDep().obs;
  static final out = ModelOut().obs;

  static final masterDep = <ModelDep>[].obs;
  static final masterOut = <ModelOut>[].obs;
  static final listDashboard = <ModelDashboardV2>[].obs;
}

class Pref<T> {
  final String? key;

  Pref.user() : key = "user";
  Pref.isLogin() : key = "isLogin";
  Pref.isIntro() : key = "isIntro";

  Pref.tgl1() : key = "tgl1";
  Pref.tgl2() : key = "tgl2";
  Pref.dep() : key = "dep";
  Pref.out() : key = "out";

  T get() => GetStorage().read(key!);
  void set(dynamic value) => GetStorage().write(key!, value);
  bool isData() => GetStorage().hasData(key!);
}

class Util {
  init() {
    final tgl1 = DateTime.now().toString().split(" ")[0].toString();
    final tgl2 = DateTime.now().toString().split(" ")[0].toString();

    Val.tgl1.value = Pref.tgl1().isData() ? Pref<String>.tgl1().get() : tgl1;
    Val.tgl2.value = Pref.tgl2().isData() ? Pref<String>.tgl2().get() : tgl2;

    Val.dep.value = Pref.dep().isData()? ModelDep.fromJson(Pref.dep().get()) : ModelDep();
    Val.out.value = Pref.out().isData()? ModelOut.fromJson(Pref.out().get()) : ModelOut();

    if (Val.tgl1.value == "") {
      Val.tgl1.value = DateTime.now().toString();
    }

    if (Val.tgl2.value == "") {
      Val.tgl2.value = DateTime.now().toString();
    }
  }

  Future<void> loadDashboard() async {
    EasyLoading.show(status: "load data ...");
    final dash = await Conn().dashBoard();
    
    try {
      final data = jsonDecode(dash.body);
      if(data.runtimeType == List<dynamic>){
        final dataDash = List.from(data).map((e) => ModelDashboardV2.fromJson(e)).toList();
        Val.listDashboard.assignAll(dataDash);
        print(dataDash.length);
      }

    } catch (e) {
      EasyLoading.showToast("kesalahan penganbilan data dashboard");
      print(e.toString());
    }
    

    // try {
    //   print(jsonDecode(dash.body));
    //   if (jsonDecode(dash.body)['penjualan'] != null) {
    //     Val.dashboard.value = ModelDashboard.fromJson(jsonDecode(dash.body));
    //   }
    // } catch (e) {
    //   print(e);
    //   print("gak dapet data dari server , dashboard Val.dart");

    // }

    EasyLoading.dismiss();
  }

  Future<void> loadMasterDep() async {
    final dep = await Conn().masterDep();

    if (jsonDecode(dep.body).runtimeType == List<dynamic>) {
      final dataDep = List<Map<String, dynamic>>.from(jsonDecode(dep.body))
          .map((e) => ModelDep.fromJson(e)).toList();
      Val.masterDep.assignAll(dataDep);
    }
  }

  Future<void> loadMasterOut() async {
    final out = await Conn().masterOut();
    if (jsonDecode(out.body).runtimeType == List<dynamic>) {
      final dataOut =
          List.from(jsonDecode(out.body)).map((e) => ModelOut.fromJson(e)).toList();
      Val.masterOut.assignAll(dataOut);
    }
  }
}


class Warna{
  static const primary1 = 0xff94D0CC;
}

