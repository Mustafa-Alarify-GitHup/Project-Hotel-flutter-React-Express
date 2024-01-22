import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Api/Model.dart';
import 'package:hotial/Loding.dart';
import 'package:hotial/propt.dart';

import '../Controller/HomeController.dart';
import '../Widget/Card_Hotel.dart';

class Home extends StatelessWidget {
  @override
  HomeController controller = Get.put(HomeController());

  Widget build(BuildContext context) {
    controller.GetData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: ColorApp.c1,
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
          builder: (con) =>
          con.loding
              ? Loding()
              : ListView.builder(
              itemCount: controller.hotel.length,
              itemBuilder: (context, index) {
                return Card_Hotel(
                    img: '${controller.hotel[index][Model_Hotel.img]}',
                    name: '${controller.hotel[index][Model_Hotel.name]}',
                    start: controller.start[index],
                    description: '${controller.hotel[index][Model_Hotel.dec]}',
                    price: controller.hotel[index][Model_Hotel.price],
                    imgList: [
                      '${controller.hotel[index][Model_Hotel.img1]}',
                      '${controller.hotel[index][Model_Hotel.img2]}',
                      '${controller.hotel[index][Model_Hotel.img3]}',
                      '${controller.hotel[index][Model_Hotel.img4]}'

                    ]);
              })),
    );
  }
}