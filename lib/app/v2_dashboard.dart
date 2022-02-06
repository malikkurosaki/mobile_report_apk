import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_report/app/dashboard_options.dart';
import 'package:mobile_report/app/v2_dashboard_detail.dart';
import 'package:mobile_report/app/v2_dashboard_option.dart';
import 'package:mobile_report/app/v2_detail_total_revenue.dart';
import 'package:mobile_report/v2_models.dart';
import 'package:mobile_report/v2_pref.dart';
import 'package:mobile_report/v2_test.dart';
import 'package:mobile_report/v2_val.dart';

import 'v2_dashboard_card.dart';
import 'v2_dashboard_panel.dart';

class V2Dashboard extends StatelessWidget {
  const V2Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            V2DashboardPanel(),
            V2DashboadItemCard(
              heroTag1: "food",
              bgColor: Colors.green,
              billValue: NumberFormat.simpleCurrency(locale: "id-ID").format(
                  V2Val.food.value.bill == null ? 0 : V2Val.food.value.bill),
              onDetail: () {
                Get.to(
                    V2DashboardDetail(
                      title: "Food",
                      heroTag1: "food",
                      icon1: Icons.restaurant,
                    ),
                    transition: Transition.noTransition,
                    duration: Duration(milliseconds: 500));
              },
              title: "Food",
              value:  NumberFormat.simpleCurrency(locale: "id-ID").format(
                  V2Val.food.value.gtotal == null
                      ? 0
                      : int.parse(V2Val.food.value.gtotal.toString())),
              titleIcon: Icons.restaurant,
            ),
            V2DashboadItemCard(
              heroTag1: "beverage",
              bgColor: Colors.red,
              billValue: NumberFormat.simpleCurrency(locale: "id-ID").format(
                  V2Val.beverage.value.bill == null
                      ? 0
                      : int.parse(V2Val.beverage.value.bill.toString())),
              onDetail: () {
                Get.to(
                    V2DashboardDetail(
                      title: "Beverage",
                      heroTag1: "beverage",
                      icon1: Icons.coffee,
                    ),
                    transition: Transition.noTransition,
                    duration: Duration(seconds: 1));
              },
              title: "Beverage",
              value: NumberFormat.simpleCurrency(locale: "id-ID").format(
                  V2Val.beverage.value.gtotal == null
                      ? 0
                      : int.parse(V2Val.beverage.value.gtotal.toString())),
              titleIcon: Icons.coffee,
            ),
            V2DashboadItemCard(
              heroTag1: "other",
              bgColor: Colors.orange,
              billValue: NumberFormat.simpleCurrency(locale: "id-ID").format(
                  V2Val.other.value.bill == null ? 0 : int.parse(V2Val.other.value.bill.toString())),
              onDetail: () {
                Get.to(
                    V2DashboardDetail(
                      title: "Other",
                      heroTag1: "other",
                      icon1: Icons.fastfood,
                    ),
                    transition: Transition.noTransition,
                    duration: Duration(seconds: 1));
              },
              title: "Others",
              value: NumberFormat.simpleCurrency(locale: "id-ID").format(
                  V2Val.other.value.gtotal == null
                      ? 0
                      : int.parse(V2Val.other.value.gtotal.toString())),
              titleIcon: Icons.fastfood,
            ),
            InkWell(
              onTap: () => Get.to(V2DetailTotalRevenue()),
              child: Card(
                color: Colors.cyan,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Revenue",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(NumberFormat.simpleCurrency(locale: "id-ID").format(V2Val.totalRevenue.value.gtotal == null ? 0: int.parse(V2Val.totalRevenue.value.gtotal.toString())), 
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
