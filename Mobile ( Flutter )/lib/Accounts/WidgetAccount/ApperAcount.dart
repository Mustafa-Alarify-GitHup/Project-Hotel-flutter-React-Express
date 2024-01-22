import 'package:flutter/material.dart';

import '../../propt.dart';

class ApperAcount extends StatelessWidget {
final String titel;
final String body;

  const ApperAcount({super.key, required this.titel, required this.body});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${this.titel}",style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: ColorApp.c1),),
          SizedBox(height: 40,),
          Text(
            "${this.body}",
            style: TextStyle(fontSize: 20,color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
