import 'package:flutter/material.dart';
import 'package:hotial/propt.dart';

class ButtonAcount extends StatelessWidget {
  final String txt;
  final void Function()? onTap;
  final Color color_;

  const ButtonAcount(
      {super.key,
      required this.txt,
      required this.onTap,
      required this.color_});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
            color: color_, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
