import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color primaryColor = Color(0xff089eb6);
  Color white_color = Colors.white;
  Color light_border_color = Color(0xff66f6ffff);
  Color blue_me_chat_light = Color(0xffE4EEF3);
  Color box_description = Colors.white;
  Color blue_customer_chat_light = Color(0xffE2F7F8);
  Color primaryColorLight = Color(0xff2c2b2b);
  Color backgroundColor = Color(0xfff1f4fb);
  Color dividerColor = Color(0xff35089eb6);
  Color textfieldColor = Colors.white;
  String? path;
  String splash_path='';

  setSelectedTheme({ required Color primaryColor,
    required Color white_color,
    required Color light_border_color,
    required Color blue_me_chat_light,
    required Color blue_customer_chat_light,
    required Color box_description,
    required Color primaryColorLight,
    required Color backgroundColor,
    required Color dividerColor,
    required Color textfieldColor, String? path,String splash_path=''}) {
    this.primaryColorLight = primaryColorLight;
    this.white_color = white_color;
    this.light_border_color = light_border_color;
    this.blue_me_chat_light = blue_me_chat_light;
    this.blue_customer_chat_light = blue_customer_chat_light;
    this.primaryColor = primaryColor;
    this.box_description = box_description;
    this.backgroundColor = backgroundColor;
    this.dividerColor = dividerColor;
    this.textfieldColor = textfieldColor;
    this.path = path;
    this.splash_path=splash_path;
    notifyListeners();
  }

  setDarkBlue() {
    this.box_description = Color(0xff1A5D7A).withOpacity(0.9);
    this.primaryColor = Color(0xff073E55);
    white_color = Colors.white;
    this.light_border_color = Color(0xff66f6ffff);
    this.blue_me_chat_light = Color(0xff1A5D7A).withOpacity(0.9);
    this.blue_customer_chat_light= Color(0xff1A5D7A).withOpacity(0.9);
    this.primaryColorLight = Colors.white;
    this.backgroundColor = Color(0xff1A5D7A);
    this.dividerColor = Color(0xff089EB6);
    this.textfieldColor = Color(0xff1A5D7A).withOpacity(0.5);
    this.path = 'assets/images/themes/Conversion.png';
    this.splash_path='assets/images/themes/framedark_blue.svg';
    notifyListeners();
  }
  setDarkBink(){
    this.box_description = Color(0xff5C2B3F).withOpacity(0.9);
    this.primaryColor = Color(0xff5C2B3F);
    white_color = Colors.white;
    this.light_border_color = Color(0xff66f6ffff);
    this.blue_me_chat_light =Color(0xff5C2B3F).withOpacity(0.9);
    this.blue_customer_chat_light = Color(0xff5C2B3F).withOpacity(0.9);
    this.primaryColorLight = Colors.white;
    this.backgroundColor =Color(0xff5C2B3F).withOpacity(0.9);
    this.dividerColor = Color(0xff5C2B3F).withOpacity(0.5);
    this.textfieldColor = Color(0xff5C2B3F).withOpacity(0.9);
    this.path = 'assets/images/themes/pink_theme.png';
    this.splash_path='assets/images/themes/framedrak_bink.svg';
    notifyListeners();
  }
  setDarkBurple(){
    this.box_description = Color(0xff50396b);
    this.primaryColor = Color(0xff251048);
    white_color = Colors.white;
    this.light_border_color = Color(0xff66f6ffff);
    this.blue_me_chat_light =Color(0xff50396b);
    this.blue_customer_chat_light =Color(0xff50396b);
    this.primaryColorLight = Colors.white;
    this.backgroundColor = Color(0xff251048).withOpacity(0.9);
    this.dividerColor = Color(0xff432e6f).withOpacity(0.9);
    this.textfieldColor = Color(0xff50396b);
    this.path = 'assets/images/themes/purple_theme.png';
    this.splash_path='assets/images/themes/framedark_purple.svg';
    notifyListeners();
  }
  setLightBlue() {
    this.box_description = Color(0xffE4EEF3);
    this.primaryColor = Color(0xff089eb6);
    this.white_color = Colors.white;
    this.light_border_color = Color(0xff66f6ffff);
    this.blue_me_chat_light = Color(0xffE4EEF3);
    this.blue_customer_chat_light = Color(0xffE2F7F8);
    this.primaryColorLight = Color(0xff2c2b2b);
    this.backgroundColor = Color(0xfff1f4fb);
    this.dividerColor = Color(0xff35089eb6);
    this.textfieldColor = Colors.white;
    this.path = null;
    this.splash_path='assets/images/frame_splash.svg';
    notifyListeners();
  }

  setLightBink() {
    this.box_description =  Color(0xffFFE4DF);
    this.primaryColor = Color(0xffA58CB3);
    this.white_color = Colors.white;
    this.light_border_color = Color(0xff66f6ffff);
    this.blue_me_chat_light = Color(0xffFFE4DF);
    this.blue_customer_chat_light = Color(0xffF6E7FF);
    this.primaryColorLight = Color(0xff2c2b2b);
    this.backgroundColor = Color(0xffFFF1F1);
    this.dividerColor = Color(0xffD8CFED);
    this.textfieldColor = Colors.white;
    this.path = null;
    this.splash_path='assets/images/themes/framelight_bink.svg';
    notifyListeners();
  }

  setLightBlueGrey() {
    this.box_description = Color(0xffE4EEF3);
    this.primaryColor = Color(0xff89C2BB);
    this.white_color = Colors.white;
    this.light_border_color = Color(0xff66f6ffff);
    this.blue_me_chat_light = Color(0xffE4EEF3);
    this.blue_customer_chat_light = Color(0xffE2F7F8);
    this.primaryColorLight = Color(0xff2c2b2b);
    this.backgroundColor = Color(0xffFFF1F1);
    this.dividerColor = Color(0xffA2D3CD);
    this.textfieldColor = Colors.white;
    this.path = null;
    this.splash_path='assets/images/themes/framelight_blue_gray.svg';
    notifyListeners();
  }
}