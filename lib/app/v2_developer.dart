import 'package:flutter/material.dart';
import 'package:mobile_report/app/v2_register.dart';
import 'package:mobile_report/v2_util.dart';
import 'package:mobile_report/v2_val.dart';
import 'package:get/get.dart';

class V2Developer extends StatelessWidget {
  const V2Developer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              Flexible(
                child: ListView(
                  children: [
                    Divider(),
                    Text("User"),
                    Text(V2Val.user.toJson().toString()),
                    ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      title: Text("List User"),
                      children: [
                        for (final lu in V2Val.listUser)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(lu.email.toString()),
                              ),
                              Divider()
                            ],
                          )
                      ],
                      onExpansionChanged: (value) {
                        V2Util().getListUser();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.add_reaction_rounded),
                      title: Text("Register"),
                      onTap: () => Get.to(V2Register()),
                    ),
                    CheckboxListTile(
                      title: Text("Is DEbug"),
                      value: V2Val.config.value.isDebug, 
                      onChanged: (value){
                        V2Val.config.value.isDebug = !V2Val.config.value.isDebug!;
                        V2Val.config.refresh();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
