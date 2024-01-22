import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Loding.dart';
import '../../propt.dart';
import '../Conrtollers Acount/Controller_Login.dart';
import '../WidgetAccount/ApperAcount.dart';
import '../WidgetAccount/ButtonAccount.dart';
import '../WidgetAccount/ButtonText.dart';
import '../WidgetAccount/TextFiledAcount.dart';
import 'SignUp.dart';

class Login extends StatelessWidget {
  Controller_Login controller = Get.put(Controller_Login());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GetBuilder<Controller_Login>(builder: (con)=>controller.loding?Loding(): SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ApperAcount(
                  titel: "Login",
                  body:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae eius accusamus vero atque odit porro quia, labore perspic porro quia, labore perspic'),
              TextFiledAccount(
                  controller_: controller.email,
                  isPassword: false,
                  label: "E-mail",
                  hintText: "Enter Your Email here...",
                  icon: Icons.email_outlined),
              TextFiledAccount(
                  controller_: controller.password,
                  isPassword: true,
                  label: "Password",
                  hintText: "Enter Your Password here...",
                  icon: Icons.password_outlined),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  ButtonText(txt: "Forget password", onTap: (){}),
                  ButtonText(txt: "Remember My", onTap: (){}),
                ],),
              ),

              SizedBox(height: 50,),
              ButtonAcount(txt: "Login", onTap: (){controller.LoginUser();}, color_: ColorApp.c1),
              SizedBox(height: 10,),
              ButtonText(txt: "I don`t Have Account Click Here...", onTap: (){Get.to(SignUp());})
            ],
          ),
        )));
  }
}
