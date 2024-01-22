import 'package:get/get.dart';
import 'package:hotial/Api/Api.dart';
import 'package:hotial/Api/LinksApi.dart';

class HomeController extends GetxController {
  bool loding = true;
  List hotel = [];
  List start = [];

  GetData() async {
    loding = true;
    hotel.clear();
    start.clear();
    try {
      var respones = await Api.getData(LinkApp.Hotel);
      hotel.addAll(respones['data']);
      // Starts
      for (int i = 0; i < hotel.length; i++) {
        var n1 = respones['data'][i]['start'];
        var n2 = respones['data'][i]['counter_start'];
        var n3 = n1/n2;
        start.add(n3);
      }
    } catch (E) {
      print('Error :$E');
    }

    loding = false;
    update();
  }


}