import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotial/Accounts/WidgetAccount/ApperAcount.dart';
import 'package:hotial/Accounts/WidgetAccount/ButtonAccount.dart';
import 'package:hotial/Accounts/WidgetAccount/ButtonText.dart';
import 'package:hotial/Accounts/WidgetAccount/TextFiledAcount.dart';
import 'package:hotial/Accounts/page/Login.dart';
import 'package:hotial/Loding.dart';
import '../Conrtollers Acount/Contoller_signup.dart';
import '../../propt.dart';

class SignUp extends StatelessWidget {
  contoller_Signup controller = Get.put(contoller_Signup());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<contoller_Signup>(builder: (con)=>con.loding?Loding(): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ApperAcount(
                titel: "Sign Up",
                body:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae eius accusamus vero atque odit porro quia, labore perspic porro quia, labore perspic'),
            TextFiledAccount(
                controller_: controller.user_name,
                isPassword: false,
                label: "Name",
                hintText: "Enter Your Name here...",
                icon: Icons.person_outline_outlined),
            TextFiledAccount(
                controller_: controller.user_email,
                isPassword: false,
                label: "E-mail",
                hintText: "Enter Your Email here...",
                icon: Icons.email_outlined),
            TextFiledAccount(
                controller_: controller.user_password,
                isPassword: true,
                label: "Password",
                hintText: "Enter Your Password here...",
                icon: Icons.password_outlined),
            const SizedBox(height: 50,),
            ButtonAcount(txt: "Sign Up", onTap: (){controller.SignUP_user();}, color_: ColorApp.c1),
            const SizedBox(height: 10,),
            ButtonText(txt: "I Have Account Click Here...", onTap: (){Get.off(Login(),transition: Transition.size);})
          ],
        ),
      ),)
    );
  }
}
