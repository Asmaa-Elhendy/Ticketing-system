import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/projects_provider.dart';
import 'package:ticketing_system/controller/provider/subcategories_provider.dart';
import 'package:ticketing_system/model/project_model.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/widgets/button.dart';

import 'dart:io';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../../widgets/my_text_field.dart';
import '../notification.dart';

class AddNewCanned extends StatefulWidget {

  @override
  State<AddNewCanned> createState() => _AddNewCannedState();
}

class _AddNewCannedState extends State<AddNewCanned> {
  TextEditingController title_controller=TextEditingController();
 TextEditingController text_controller=TextEditingController();
bool status=false;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;


    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus;
        currentFocus=FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar:  AppBar(backgroundColor: _themeProvider.primaryColor,foregroundColor: _themeProvider.primaryColorLight,
          title:  Text('SVITSM',
              style: TextStyle(
                fontFamily: 'Roboto',
                color:_themeProvider.primaryColorLight,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.15,

              )
          ),actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push( createRoute(NotificationScreen()));
            }, icon: Icon(Icons.notifications)),
            IconButton(onPressed: (){
              Navigator.of(context).push( createRoute(ProfileSettings()));
            }, icon: Icon(Icons.account_circle,size: 27,))],
        ),
        drawer:Container(
            width: width*.7,
            child: DrawerPage()
        ),body: Container(width:width,height:height,
        decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
        BoxDecoration(
          color:_themeProvider. backgroundColor,
          image:  DecorationImage(
            image: AssetImage(_themeProvider.path!),
            fit: BoxFit.cover,
          ),),
        child: Container(
          height: height,
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: height*.01,horizontal: width*.04),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: height*.008,horizontal: width*.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,)),

                        Expanded(
                          child: Text('Add New Canned Response',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color:_themeProvider.primaryColorLight,
                                fontSize: width*.05,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.15,

                              )
                          ),
                        ),
                      ],),
                  ), Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: 3, color: _themeProvider.white_color, // Color(0xff2c2b2b)
                            ),
                            bottom:
                            BorderSide(width: 3, color: _themeProvider.light_border_color),
                            left:
                            BorderSide(width: 3, color: _themeProvider.light_border_color),
                            right: BorderSide(
                                width: 3, color: _themeProvider.light_border_color))),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          custom_text('Canned Response Title',height,_themeProvider),

                          MyTextField(hinttext:'Canned Response Title',controllerValue: title_controller,),
                          custom_text('Canned Response Message',height,_themeProvider),
                          Container(
                            width: width*.8,
                            height: height*.17,
                            decoration: BoxDecoration(color: _themeProvider.box_description,
                                border: Border.all(color: _themeProvider.primaryColor),
                                borderRadius: BorderRadius.circular(10)
                            ),child: TextField(
                            style: TextStyle(color: _themeProvider.primaryColorLight),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1000,
                            controller: text_controller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:width*.02),
                              labelText: 'Enter Canned Message',
                              labelStyle: TextStyle(color: _themeProvider.primaryColorLight.withOpacity(0.5)),
                              border: InputBorder.none,
                            ),
                          ),
                          ),
                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custom_text('Status',height,_themeProvider),
                              SizedBox(width: width*.02,),
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: height*.01),
                                child: Container(
                                  child: FlutterSwitch(activeText: '',inactiveText: '',
                                    width: width*.14,inactiveColor: _themeProvider.textfieldColor,
                                    activeColor: _themeProvider.primaryColor,
                                    height: height*.03,
                                    toggleColor:status==false? _themeProvider.primaryColorLight.withOpacity(0.5):_themeProvider.primaryColorLight,
                                    inactiveSwitchBorder: Border.all(color: _themeProvider.backgroundColor),
                                    valueFontSize: 15.0,
                                    activeSwitchBorder: Border.all(color: _themeProvider.backgroundColor),
                                    toggleSize: 17,
                                    value: status,
                                    borderRadius: 30.0,
                                    padding: 5.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        status = val;
                                      });
                                    },
                                  ),
                                ),
                              ),SizedBox(width: width*.03,),
                              status?custom_text('Active', height, _themeProvider):SizedBox()
                            ],
                          ),
                          SizedBox(height: height*.03,),
                          Button(title: 'Add Canned Response')
                        ],),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
custom_text(String title,height,ThemeProvider provider){
  return   Padding(
    padding:  EdgeInsets.only(bottom: height*.02,top: height*.01),
    child: Text(title, textAlign: TextAlign.left, style: TextStyle(
        color:provider.primaryColorLight,
        fontFamily: 'Source Sans Pro',
        fontSize: 17,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.w500,
        height: 1
    ),),
  );
}