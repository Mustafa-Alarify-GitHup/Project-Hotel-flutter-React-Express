import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Const/Consts.dart';
import 'package:hotial/Home/Pages/Proprty_Hotel.dart';

class Card_Hotel extends StatelessWidget {
  final String img;
  final String name;
  final double start;
  final String description;
  final int price;
  final List imgList;

  const Card_Hotel(
      {super.key,
      required this.img,
      required this.name,
      required this.start,
      required this.description,
      required this.price,
      required this.imgList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(() => Proprty_Hotel(
            name_hotel: name,
            start: start,
            description: description,
            price: price,
            img: imgList));
      },
      child: Container(
        height: 260,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              '${Consts.img_hotel}/$img',
              fit: BoxFit.cover,
            ),
            Container(
              height: 270,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      .4,
                      1
                    ],
                    colors: [
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(1),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index + 1 <= start
                                ? Colors.yellow
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
