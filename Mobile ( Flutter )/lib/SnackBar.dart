import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/propt.dart';

SnackBar(txt){
  return  Get.snackbar("Alert", '$txt',
      backgroundColor: ColorApp.c1,
      colorText: Colors.white,
      icon: const Icon(
        Icons.add_alert_sharp,
        size: 40,
        color: Colors.red,
      ));
}