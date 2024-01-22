import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Accounts/page/Login.dart';
import 'package:hotial/Home/Pages/Home.dart';
import 'package:hotial/shared%20preferences/shared%20preferences.dart';

class IntroController extends GetxController {
  int index = 0;

  List intro = [
    {"title": "title 1", "dec": "", "img": "intro1.png"},
    {"title": "title 2", "dec": "", "img": "intro3.png"},
    {"title": "title 3", "dec": "", "img": "intro2.png"}
  ];

  PageController contro = PageController();

  MoveView(int val) {
    index = val;
    update();
  }

  Next() {
    index++;
    if (index < intro.length) {
      contro.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeInSine);
    } else {
      shared_pref.set_data_String(shared_pref.key_open_frist, "value");
      Get.offAll(()=>Login(),transition: Transition.size);
    }
  }
}
