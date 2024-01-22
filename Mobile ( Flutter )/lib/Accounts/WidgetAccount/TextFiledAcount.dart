import 'package:flutter/material.dart';
import 'package:hotial/propt.dart';

class TextFiledAccount extends StatelessWidget {
  final TextEditingController controller_;
  final bool isPassword;
  final String label;
  final String hintText;
  final IconData icon;

  const TextFiledAccount(
      {super.key,
      required this.controller_,
      required this.isPassword,
      required this.label,
      required this.hintText,
      required this.icon});

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller_,
              obscureText: isPassword,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  focusColor: ColorApp.c1,
                  filled: true,
                  label: Text("$label"),
                  labelStyle: TextStyle(fontSize: 20, color: ColorApp.c1),
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 15, color: ColorApp.c1),
                  suffixIcon: isPassword == false
                      ? Icon(
                          icon,
                      color: ColorApp.c1
                        )
                      : IconButton(onPressed: () {}, icon: Icon(icon,color: ColorApp.c1)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorApp.c1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ],
        ));
  }
}
