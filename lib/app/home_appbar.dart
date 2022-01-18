import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_report/Val.dart';
import 'package:get/get.dart';
import 'package:mobile_report/app/dashboard_options.dart';
import 'package:mobile_report/app/home_tabbar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:mobile_report/ext.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(238, 238, 238, 1),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg_1.webp'))),
        child: Stack(
          children: [
            Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
            ),
            ListView(
              children: [
                SizedBox(
                  width: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Nama User",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            color: Colors.grey[900],
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      Text("Wellcome Back , Have Anice Day , 2020-01-01",
                                        style: TextStyle(
                                          color: Colors.yellow[200]
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child:
                                            const Text("Date ").txtMenuBold()),
                                    Expanded(
                                      flex: 2,
                                      child: Obx(
                                        () => Row(
                                          children: [
                                            Expanded(
                                                child: Text(DateFormat(
                                                            'dd-MM-yyyy')
                                                        .format(DateTime.parse(
                                                            Val.tgl1.value)))
                                                    .txtMenu()),
                                            Expanded(
                                                child: Text(DateFormat(
                                                            "dd-MM-yyyy")
                                                        .format(DateTime.parse(
                                                            Val.tgl2.value)))
                                                    .txtMenu())
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text("Departement ").txtMenuBold(),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Obx(
                                        () => Text(Val.dep.value.namaDept
                                                .toString()
                                                .split(" ")[0])
                                            .txtMenu(),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text("Outlet ").txtMenuBold(),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Obx(
                                        () => Text(
                                          Val.out.value.namaOut.toString(),
                                        ).txtMenu(),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: CircleAvatar(
                                        child: IconButton(
                                            onPressed: () {
                                              Util().loadDashboard();
                                            },
                                            icon: Icon(Icons.refresh)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: CircleAvatar(
                                        child: IconButton(
                                            onPressed: () async {
                                              await Util().loadMasterDep();
                                              await Util().loadMasterOut();
                                              Get.to(DashboardOptions(),
                                                  transition:
                                                      Transition.downToUp);
                                            },
                                            icon: Icon(Icons.arrow_drop_down)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Slidable(
                      //     startActionPane: ActionPane(
                      //       motion: ScrollMotion(),
                      //       children: [
                      //         SlidableAction(
                      //           label: "refresh",
                      //           autoClose: true,
                      //           backgroundColor: Colors.blue,
                      //           onPressed: (context) async {
                      //             Util().loadDashboard();
                      //           },
                      //           icon: Icons.refresh,
                      //         ),
                      //         SlidableAction(
                      //           label: "selection",
                      //           backgroundColor: Colors.blue,
                      //           onPressed: (context) async {
                      //             await Util().loadMasterDep();
                      //             await Util().loadMasterOut();
                      //             Get.to(DashboardOptions(),
                      //                 transition: Transition.downToUp);
                      //           },
                      //           icon: Icons.arrow_drop_down_circle_rounded,
                      //         )
                      //       ],
                      //     ),
                      //     child: Container(
                      //       color: Colors.blue,
                      //       padding: const EdgeInsets.all(16),
                      //       child: Row(
                      //         children: [
                      //           Text("Swipe More",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.bold
                      //             ),
                      //           ),
                      //           Icon(Icons.arrow_forward_ios,
                      //             color: Colors.white,
                      //           )
                      //         ],
                      //       ),
                      //     ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      expandedHeight: 300,
    );
  }
}
