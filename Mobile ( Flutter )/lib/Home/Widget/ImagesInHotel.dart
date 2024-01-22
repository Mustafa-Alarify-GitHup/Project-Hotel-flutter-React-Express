import 'package:flutter/material.dart';

import '../../Const/Consts.dart';

class ImagesInHotel extends StatelessWidget {
  final List img;

  const ImagesInHotel({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: double.infinity,
      height: 250,
      child: PageView.builder(
          itemCount: img.length,
          itemBuilder: (context, index) =>
             img!=''? Image.asset('${Consts.img_hotel}/${img[index]}',fit: BoxFit.cover,):Image.asset('${Consts.img_hotel}/5.png',fit: BoxFit.cover,)),
    );

  }

}
