import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/1_Intro/page/Intro.dart';
import 'package:hotial/Accounts/page/Login.dart';
import 'package:hotial/Const/Consts.dart';
import 'package:hotial/Home/Pages/Home.dart';
import 'package:hotial/shared%20preferences/shared%20preferences.dart';
import 'package:lottie/lottie.dart';

class Splach extends StatefulWidget {
  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  Future Wait() async {
    await Future.delayed(Duration(milliseconds: 1650));
    var open = await shared_pref.get_data(shared_pref.key_open_frist);
    var isLogin = await shared_pref.get_data(shared_pref.key_Login);
    if (open != null ) {
      if(isLogin == 'true'){
        Get.off(Home(), transition: Transition.size);
      }else{
        Get.off(Login(), transition: Transition.size);
      }

    } else {
      Get.off(Intro(), transition: Transition.size);
    }
  }

  @override
  void initState() {
    Wait();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(149, 134, 238, 1.0),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wellcome',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Lottie.asset(Consts.lottie_intro, onLoaded: (val) {

                })
              ],
            ),
          )),
    );
  }
}
