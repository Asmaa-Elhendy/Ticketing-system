import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/screens/profile_settings/change_image.dart';

import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/button.dart';
import '../../widgets/drawer.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/theme_data.dart';
import '../notification.dart';


class ProfileDetail extends StatelessWidget {

  // Color black_color = Color(0xff2c2b2b);
  // Color purple = Color(0xffd8cfed);
  TextEditingController fullName_controller=TextEditingController();
  TextEditingController userName_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  TextEditingController mobile_controller=TextEditingController();
  TextEditingController country_controller=TextEditingController();
  TextEditingController timezone_controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

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
        appBar: AppBar(backgroundColor: _themeProvider.primaryColor,foregroundColor: _themeProvider.primaryColorLight,elevation: 0,
          title: Text('Profile',style: TextStyle(
            fontFamily: 'SourceSansPro',
            color: _themeProvider.primaryColorLight,
            fontSize: 20,

            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,

          ),),actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push( createRoute(NotificationScreen()));
            }, icon: Icon(Icons.notifications)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],),
        drawer:Container(
            width: width*.7,
            child: DrawerPage()
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(width:width,height:height,
    decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
    BoxDecoration(
    color:_themeProvider. backgroundColor,
    image:  DecorationImage(
    image: AssetImage(_themeProvider.path!),
    fit: BoxFit.cover,
    ),),
            child: Stack(children: [

              Container(width: width,height: height*.09,color:_themeProvider.primaryColor,
                child: Column(children: [
                  SizedBox(height: height*.01,),

                ],),
              ),
              Positioned(
                  left: width*.01,

                  top:height*.03,child: IconButton(icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight),onPressed: (){
                    Navigator.pop(context);
              }),),
              Positioned(
                  left: width*.39,
                  right: width*.4,
                  top:height*.03,child: CircleAvatar(radius: width*.1,backgroundColor: _themeProvider.primaryColorLight,)),
              Positioned(
                  left: width*.33,
                  //  right: width*.4,
                  top:height*.15,child: InkWell(
                  onTap: (){
                    Navigator.of(context).push( createRoute(ChangeImage()));
                  },
                  child: Text('Change Your Image',style: TextStyle(color:  _themeProvider.primaryColorLight),))),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*.07,vertical: height*.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*.18,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide( width: 3,color:_themeProvider.white_color, // Color(0xff2c2b2b)
                            )     , bottom: BorderSide( width: 3,color:_themeProvider.light_border_color ),
                            left: BorderSide( width: 3,color:_themeProvider.light_border_color ),
                            right: BorderSide( width: 3,color:_themeProvider.light_border_color )
                        )
                      //    borderRadius:BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [SizedBox(height: height*.01,),
                          Text('Profile Details', textAlign: TextAlign.left, style: TextStyle(
                              color:  _themeProvider.primaryColorLight,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 18,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w500,
                              height: 1
                          ),),SizedBox(height: height*.01,),
                          TextTileD('Full Name',height,_themeProvider),
                          MyTextField(hinttext:'Full Name',controllerValue: fullName_controller,),
                          TextTileD('User Name',height,_themeProvider),
                          MyTextField(hinttext: 'User Name',controllerValue: userName_controller,),
                          TextTileD('Email',height,_themeProvider),
                          MyTextField(hinttext: 'Email',controllerValue: email_controller,),
                          TextTileD('Mobile Number',height,_themeProvider),
                          MyTextField(hinttext: 'Mobile Number',controllerValue: mobile_controller,),
                          TextTileD('Country',height,_themeProvider),
                          MyTextField(hinttext: 'Country',controllerValue: country_controller,),
                          TextTileD('Time Zone',height,_themeProvider),
                          MyTextField(hinttext: 'Time Zone',controllerValue: timezone_controller,),

                        ],
                      ),
                    ),
                  ),
                    SizedBox(height: height*.02,),
                    Button( title: 'Save',)
                  ],
                ),
              )

            ],),
          ),
        )
        ,
      ),
    );
  }
}
TextTileD(title,height,ThemeProvider _themeprovider){
  return Padding(
    padding:  EdgeInsets.only(top: height*.01,bottom: height*.01),
    child: Text(title, textAlign: TextAlign.left, style: TextStyle(
        color:  _themeprovider.primaryColorLight,
        fontFamily: 'Source Sans Pro',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.w500,
        height: 1
    ),),
  );
}