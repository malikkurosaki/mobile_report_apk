import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:mobile_report/Val.dart';
import 'package:mobile_report/splash.dart';

class Intro extends StatelessWidget {
  Intro({Key? key}) : super(key: key);
  PageController controller = PageController();
  final pageIndex = 0.obs;
  final listIntro = [
    IntroItem(
      title: "Judul Satu",
      subTitle: "sub title",
      bgColor: Colors.blue
    ),
    IntroItem(
      title: "Judul dua",
      subTitle: "sub dua",
      bgColor: Colors.green
    ),
    IntroItem(
      title: "Judul tiga",
      subTitle: "sub tiga",
      bgColor: Colors.red
    )
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: onLoad(),
            builder: (context, snapshot) => Text(""),
          ),
          PageView(
            onPageChanged: (value) => pageIndex.value = value,
            controller: controller,
            children: [
              for (final a in listIntro)
                Stack(
                  children: [
                    Container(
                      color: a.bgColor,
                      child: Center(
                        child: Text(a.title!),
                      ),
                    )
                  ],
                )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 70,
              color: Colors.black45,
              width: Get.width,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          for(final a in List.generate(listIntro.length, (index) => index))
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: pageIndex.value == a? Colors.white: Colors.grey,
                            ),
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(4),
                            width: 40,
                            height: 5,
                            
                          )
                        ],
                      )
                    ),
                    pageIndex.value == (listIntro.length -1) ? TextButton(
                      onPressed: () {
                        Pref.isIntro().set(false);
                        Get.off(Splash());
                      },
                      child: Text("NEXT",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ): Text("")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onLoad() async {
    
  }
}

class IntroItem{
  String? title;
  String? subTitle;
  String? image;
  Color? bgColor;

  IntroItem({this.title, this.subTitle, this.image, this.bgColor});
}
