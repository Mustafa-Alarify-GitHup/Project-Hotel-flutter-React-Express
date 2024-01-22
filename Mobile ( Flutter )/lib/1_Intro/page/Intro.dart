import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/1_Intro/Controoler/IntroController.dart';
import 'package:hotial/1_Intro/widget/HeaderIntro.dart';
import 'package:hotial/Const/Consts.dart';
import '../../propt.dart';

class Intro extends StatelessWidget {

  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderIntro(),
            Expanded(
              child: Container(
                child: PageView.builder(
                    controller: controller.contro,
                    onPageChanged: (val) {
                      controller.MoveView(val);
                    },
                    itemCount: controller.intro.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Center(
                                child: Image.asset(
                                    "${Consts.img}/${controller.intro[index]['img']}"),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            GetBuilder(
                init: IntroController(),
                builder: (con) => Container(
                      padding: EdgeInsets.only(top: 90),
                      width: double.infinity,
                      height: 280,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('${Consts.img}/under.png'),
                        fit: BoxFit.cover,
                      )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.intro[controller.index]['title']}",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "$test",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Skip"),
                                Container(
                                  width: 70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ...List.generate(
                                          controller.intro.length,
                                          (index) => AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 400),
                                                width: controller.index == index
                                                    ? 20
                                                    : 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.white,
                                                ),
                                              ))
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.Next();
                                    },
                                    child: Text(
                                      "Next",
                                      style: TextStyle(fontSize: 25),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
