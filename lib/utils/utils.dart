import 'package:shared_preferences/shared_preferences.dart';

class utils{
  
    static rememberMe( String email, password,bool isChecked) async {
    if (isChecked == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("true condition:$isChecked");
      await prefs.setString('email',email.toString());
      await prefs.setString('pwd', password.toString());
      await prefs.setBool('remember_me', isChecked);

      print("paswrd----${prefs.getString('pwd')}");
      print("mob---${prefs.getString('email')}");
      print("bool---${prefs.getBool('remember_me')}");
    } else if (isChecked == false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("falsecontition:-----$isChecked");
      await prefs.remove('pwd');
      await prefs.remove('email');
      await prefs.clear();
      
      

      print("paswrdfalse----${prefs.getString('pwd')}");
    }
  }


}