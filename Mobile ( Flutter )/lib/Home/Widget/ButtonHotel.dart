import 'package:flutter/material.dart';
import 'package:hotial/propt.dart';

class ButtonHotel extends StatelessWidget {
  final String txt;
  final void Function()? onTap;

  const ButtonHotel({super.key, required this.txt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: ColorApp.c1, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

