import 'package:flutter/material.dart';
import 'package:hotial/propt.dart';

class Loding extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          width: 250,
          height: 150,
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 20)]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: ColorApp.c1,),
              SizedBox(height: 20,),
              Text("Loding ...",style: TextStyle(fontSize: 20,color: ColorApp.c1),)
            ],)
      ),
    );
  }
}
