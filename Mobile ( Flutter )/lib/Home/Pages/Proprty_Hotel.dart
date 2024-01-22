import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Const/Consts.dart';
import 'package:hotial/Home/Widget/ButtonHotel.dart';
import 'package:hotial/Home/Widget/Description.dart';
import 'package:hotial/Home/Widget/ImagesInHotel.dart';
import 'package:hotial/Home/Widget/NameStarts_Hotel.dart';

import 'Home.dart';

class Proprty_Hotel extends StatelessWidget {
  final String name_hotel;
  final double start;
  final String description;
  final int price;
  final List img;

  const Proprty_Hotel(
      {super.key,
      required this.name_hotel,
      required this.start,
      required this.description,
      required this.price,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
          onWillPop:() async {
            Get.off(Home());
            return Future.value(false) ;
          } ,
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Image.asset("${Consts.img_hotel}/1.png"),
          Name_Hotel(name_hotel: name_hotel, start: start),
          Description(description: description, price: price),
          ImagesInHotel(img: img),
          const Spacer(),
          Center(
              child: ButtonHotel(
            txt: 'Reservation',
            onTap: () {},
          ))
      ],
    ),
        ));
  }
}
