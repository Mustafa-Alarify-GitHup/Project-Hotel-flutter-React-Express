import 'package:flutter/material.dart';

class Name_Hotel extends StatelessWidget {
final String name_hotel;
final double start;

  const Name_Hotel({super.key, required this.name_hotel, required this.start});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 70,
      color: Color.fromRGBO(199, 192, 240, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$name_hotel",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    color: index + 1 <= start ? Colors.yellow : Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )
    ;
  }

}
