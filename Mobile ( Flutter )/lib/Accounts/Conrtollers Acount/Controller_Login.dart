import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Api/Api.dart';
import 'package:hotial/Api/LinksApi.dart';
import 'package:hotial/Api/Model.dart';
import 'package:hotial/Home/Pages/Home.dart';
import 'package:hotial/shared%20preferences/shared%20preferences.dart';
import '../../propt.dart';

class Controller_Login extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loding = false;

  LoginUser() async {
    loding = true;
    update();
    if (email.text != '' && password.text != '') {
      var respones = await Api.postData(LinkApp.LoginUser,
          {Model_user.email: email.text, Model_user.password: password.text});
      if (respones['status'] == 'true') {
        shared_pref.set_data_String(shared_pref.key_Login, 'true');
        Get.offAll(() => Home(), transition: Transition.size);
      } else {
        loding = false;
        Get.snackbar("Alert", 'There is no Account with This email',
            backgroundColor: ColorApp.c1,
            colorText: Colors.white,
            icon: const Icon(
              Icons.add_alert_sharp,
              size: 40,
              color: Colors.red,
            ));
      }
    } else {
      loding = false;
      Get.snackbar("Alert", 'Please Full All Data ',
          backgroundColor: ColorApp.c1,
          colorText: Colors.white,
          icon: const Icon(
            Icons.add_alert_sharp,
            size: 40,
            color: Colors.red,
          ));
    }
    update();
  }
}
