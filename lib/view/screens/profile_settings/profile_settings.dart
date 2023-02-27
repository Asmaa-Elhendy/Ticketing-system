import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/screens/profile_settings/change_password.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_detail.dart';

import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../../widgets/theme_data.dart';
import '../home.dart';
import '../notification.dart';
import 'change_image.dart';
import 'deactive_account.dart';

class ProfileSettings extends StatelessWidget {

  // Color black_color = Color(0xff2c2b2b);
  // Color purple = Color(0xffd8cfed);

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
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(backgroundColor: _themeProvider.primaryColor,foregroundColor: _themeProvider.primaryColorLight,elevation: 0,
      title:  Text('Profile',style: TextStyle(
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
        ],
      ),
     drawer: DrawerPage(),
    body: Container(width:width,height:height,
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
        ), Positioned(
          left: width * .01,

          top: height * .03,
          child: IconButton(icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,), onPressed: () {
            Navigator.pop(context);
          }),),
        Positioned(
            left: width*.39,
            right: width*.4,
            top:height*.03,child: CircleAvatar(radius: width*.1,backgroundColor: _themeProvider.primaryColorLight,)),
        Column(
          children: [
            SizedBox(height: height*.15,),
            CustomListTile(context, _themeProvider.primaryColorLight,ProfileDetail(),Icon(Icons.manage_accounts,color: _themeProvider.primaryColorLight,),'Profile Details',_themeProvider),
            CustomListTile(context, _themeProvider.primaryColorLight, ChangePassword(),Icon(Icons.lock,color: _themeProvider.primaryColorLight),'Change Password',_themeProvider),
      CustomListTile(context, _themeProvider.primaryColorLight, ChangeImage(),Icon(Icons.image,color: _themeProvider.primaryColorLight),'Change Your Image',_themeProvider),
    CustomListTile(context, _themeProvider.primaryColorLight, DeactiveAccount(),Icon(Icons.pan_tool,color: _themeProvider.primaryColorLight),'Deactive Your Account',_themeProvider),
          ],
        )

      ],),
    )
    ,
    );
  }
}
CustomListTile(context,black_color,page,icon,title,ThemeProvider  themeProvider){
  return  ListTile(
    leading: icon,

    title:  Text(title,style: TextStyle(color: themeProvider.primaryColorLight),),
    onTap: () {

      Navigator.of(context).push( createRoute(page));
    },
  );
}
