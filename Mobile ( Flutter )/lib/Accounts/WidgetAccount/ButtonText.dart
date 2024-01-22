import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String txt;
final void Function()? onTap;

  const ButtonText({super.key, required this.txt,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Text(txt,style: TextStyle(color:Colors.grey,fontSize: 17,fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline),),
    );
  }
}
