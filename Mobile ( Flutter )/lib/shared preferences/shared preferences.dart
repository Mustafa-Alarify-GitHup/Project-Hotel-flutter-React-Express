import 'package:shared_preferences/shared_preferences.dart';
class shared_pref {
  static set_data_String(key, value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setString(key, value);
  }
  static get_data( key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
   var value = share.getString(key);
    return value;
  }

  static String key_open_frist = "fristssssssss";
  static String key_Login= "key_Login";

}