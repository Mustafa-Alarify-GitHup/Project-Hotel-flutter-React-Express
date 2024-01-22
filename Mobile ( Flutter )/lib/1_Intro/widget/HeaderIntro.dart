import 'package:flutter/material.dart';

import '../../Const/Consts.dart';

class HeaderIntro extends StatelessWidget {
  const HeaderIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150,
        alignment: Alignment.topRight,
        child: Image.asset(
          "${Consts.img}/up.png",
          width: 150,
        ));
  }

}
