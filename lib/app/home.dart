import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/app/dashboard.dart';
import 'package:mobile_report/app/home_appbar.dart';
import 'package:mobile_report/app/home_tabbar.dart';
import 'package:mobile_report/conn.dart';
import 'package:get/get.dart';
import 'package:mobile_report/models.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeinit();
    super.initState();
  }

  homeinit() async {
    await Util().init();
    await Util().loadDashboard();
    await Util().loadMasterDep();
    await Util().loadMasterOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: HomeTabbar(),
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            HomeAppBar(),
          ],
          body: TabBarView(
            children: [
              Dashboard(),
              Text("dua"),
              Text("dua"),
            ],
          ),
        ),
      ),
    );
  }

//   InkWell(
//   onTap: () {
//     Get.bottomSheet(
//       DraggableScrollableSheet(
//         builder: (context, scrollController) => Card(
//           child: Container(
//             padding: EdgeInsets.all(16),
//             child: ListView(
//               controller: scrollController,
//               children: [Text("hahah ini ada diamana")],
//             ),
//           ),
//         ),
//       ),
//       isScrollControlled: true,
//       isDismissible: true,
//     );
//   },
//   child: Card(
//     color: Colors.blue,
//     child: Container(
//       width: Get.width,
//       padding: EdgeInsets.all(8),
//       child: Obx(() => Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                             child: Text(
//                           "Tanggal",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         )),
//                         Expanded(
//                             child: Text("Departement",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white))),
//                         Expanded(
//                             child: Text("Outlet",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white))),
//                       ],
//                     ),
//                     Divider(),
//                     Flexible(
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Text(
//                             Val.tgl.value
//                                 .toString()
//                                 .split(" ")[0]
//                                 .toString(),
//                             style:
//                                 TextStyle(color: Colors.white54),
//                           )),
//                           Expanded(
//                               child: Text(
//                             Val.dep.value,
//                             style:
//                                 TextStyle(color: Colors.white54),
//                           )),
//                           Expanded(
//                               child: Text(
//                             Val.out.value,
//                             style:
//                                 TextStyle(color: Colors.white54),
//                           )),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Icon(Icons.arrow_drop_down)
//             ],
//           )),
//     ),
//   ),
// )

  // Future<void> onLoad() async {
  //   final dash = await Conn().dashBoard("2021-01-01", "", "");
  //   Val.dashboard.value = ModelDashboard.fromJson(dash.body);
  // }

  Drawer drawer() => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [Text("drawer header")],
              ),
            )
          ],
        ),
      );
}
