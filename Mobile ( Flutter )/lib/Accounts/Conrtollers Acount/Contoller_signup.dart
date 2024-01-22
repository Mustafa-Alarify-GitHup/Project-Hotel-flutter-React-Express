import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Api/Api.dart';
import 'package:hotial/Api/LinksApi.dart';
import 'package:hotial/Api/Model.dart';
import 'package:hotial/Home/Pages/Home.dart';
import 'package:hotial/propt.dart';
import 'package:hotial/shared%20preferences/shared%20preferences.dart';

class contoller_Signup extends GetxController {
  TextEditingController user_name = TextEditingController();
  TextEditingController user_email = TextEditingController();
  TextEditingController user_password = TextEditingController();

  bool loding = false;

  SignUP_user() async {
    loding = true;
    update();
    if (user_name.text != "" &&
        user_password.text != "" &&
        user_email.text != "") {
      if (user_password.text.length >= 8) {
        var respones = await Api.postData(LinkApp.Add_New_User, {
          Model_user.name: user_name.text,
          Model_user.email: user_email.text,
          Model_user.password: user_password.text,
        });
        print("==================================================");
        print(respones);
        print("==================================================");

        if (respones['Status'] == 'true') {
          shared_pref.set_data_String(shared_pref.key_Login, 'true');
          Get.offAll(() => Home());
        }
      } else {
        loding = false;
        Get.snackbar("Alert", 'The password must be greater than 8 ',
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
