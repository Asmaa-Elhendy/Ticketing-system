import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/save_theme_storage.dart';
import 'package:ticketing_system/view/widgets/drawer.dart';

import '../../controller/page_route.dart';
import '../../controller/provider/theme_provider.dart';
import '../widgets/theme_data.dart';
import 'dashboard.dart';
import 'notification.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Color black_color = Color(0xff2c2b2b);

  var items = [
    'English',
    'Arabic',
  ];
  bool status = false;
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: _themeProvider.primaryColor,
        foregroundColor: _themeProvider.primaryColorLight,
        title: Text('SVITSM',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _themeProvider.primaryColorLight,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.15,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(NotificationScreen()));
              },
              icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: WillPopScope(
        onWillPop: ()async{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Dashboard()),ModalRoute.withName('/'),);
          return true;
        },
        child: Container(
          width:width,height:height,
          decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
          BoxDecoration(
            color:_themeProvider. backgroundColor,
            image:  DecorationImage(
              image: AssetImage(_themeProvider.path!),
              fit: BoxFit.cover,
            ),),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: _themeProvider.primaryColorLight,
                          )),
                      SizedBox(
                        width: width * .20,
                      ),
                      Text('SETTINGS',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: _themeProvider.primaryColorLight,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.15,
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      //   color: Color(0xffe4eef3),
                      //  border: Border.all(color:Color(0xff8e8c8c),),
                      border: Border(
                          top: BorderSide(
                            width: 3,
                            color:
                                _themeProvider.white_color, // Color(0xff2c2b2b)
                          ),
                          bottom: BorderSide(
                              width: 3, color: _themeProvider.light_border_color),
                          left: BorderSide(
                              width: 3, color: _themeProvider.light_border_color),
                          right: BorderSide(
                              width: 3, color: _themeProvider.light_border_color))
                      //    borderRadius:BorderRadius.circular(8),
                      ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * .03, horizontal: width * .03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * .03),
                          child: Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: _themeProvider.primaryColorLight,
                            ),
                          ),
                        ),
                        Container(
                            height: height * .05,
                            width: width * .9,
                            decoration: BoxDecoration(
                                color: _themeProvider.white_color,
                                border: Border.all(
                                    color: _themeProvider.primaryColor),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2),
                                child: DropdownButtonFormField(
                                    items: items.map((String lang) {
                                      return new DropdownMenuItem(
                                          value: lang, child: Text(lang));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      dropdownvalue = newValue!;

                                      setState(() {});
                                    },
                                    value: dropdownvalue,
                                    decoration: InputDecoration.collapsed(
                                      //  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                                      //  filled: true,

                                      fillColor: Colors.grey[200],

                                      hintText: 'Select language',

                                      //   errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                                    )))),
                        Text(
                          'Light Themes',
                          style: TextStyle(
                              color: _themeProvider.primaryColorLight,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * .02),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _themeProvider.setLightBlue();
                                  LocalStorage storage = LocalStorage();
                                  storage.saveToDisk('light_blue', null,'assets/images/frame_splash.svg');
                                },
                                child:
                                    themeShape(Color(0xff089EB6), width, height),
                              ),
                              InkWell(
                                onTap: () {
                                  _themeProvider.setLightBink();
                                  LocalStorage storage = LocalStorage();
                                  storage.saveToDisk('light_pink', null,'assets/images/themes/framelight_bink.svg');
                                },
                                child:
                                    themeShape(Color(0xffA58CB3), width, height),
                              ),
                              InkWell(
                                onTap: () {
                                  _themeProvider.setLightBlueGrey();
                                  LocalStorage storage = LocalStorage();
                                  storage.saveToDisk('light_blue_gray', null,'assets/images/themes/framelight_blue_gray.svg');
                                },
                                child:
                                    themeShape(Color(0xff89C2BB), width, height),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Dark Themes',
                          style: TextStyle(
                              color: _themeProvider.primaryColorLight,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * .02),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _themeProvider.setDarkBlue();
                                  GetStorage storage2 = GetStorage();
                                  LocalStorage storage = LocalStorage();
                                  storage.saveToDisk('dark_blue',
                                      'assets/images/themes/Conversion.png','assets/images/themes/framedark_blue.svg');
                                },
                                child: themeDarkShape(
                                    'assets/images/themes/Conversion.png',
                                    width,
                                    height),
                              ),
                              InkWell(
                                onTap: () {
                                  _themeProvider.setDarkBink();
                                  GetStorage storage2 = GetStorage();
                                  LocalStorage storage = LocalStorage();
                                  storage.saveToDisk('dark_pink',
                                      'assets/images/themes/pink_theme.png','assets/images/themes/framedrak_bink.svg');
                                },
                                child: themeDarkShape(
                                    'assets/images/themes/pink_theme.png',
                                    width,
                                    height),
                              ),
                              InkWell(
                                  onTap: () {
                                    _themeProvider.setDarkBurple();
                                    GetStorage storage2 = GetStorage();
                                    LocalStorage storage = LocalStorage();
                                    storage.saveToDisk('dark_purple',
                                        'assets/images/themes/purple_theme.png','assets/images/themes/framedark_purple.svg');
                                  },
                                  child: themeDarkShape(
                                    'assets/images/themes/purple_theme.png',
                                    width,
                                    height,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

themeShape(Color color, width, height) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: ClipOval(
      child: Container(
        color: color,
        width: width * .15,
        height: height * .08,
      ),
    ),
  );
}

themeDarkShape(String path, width, height) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: ClipOval(
        child: Image.asset(
      path,
      fit: BoxFit.cover,
      width: width * .15,
      height: height * .08,
    )),
  );
}
