
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/theme_provider.dart';
import 'package:ticketing_system/view/screens/splash_screen.dart';
import 'package:ticketing_system/view/widgets/button.dart';

import '../../../controller/page_route.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/theme_data.dart';
import '../dashboard.dart';
import '../home.dart';
import 'forget_password.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();

  bool isChecked=false;

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
        body: Container(
    width:width,height:height,
    decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
    BoxDecoration(
    color:_themeProvider. backgroundColor,
    image:  DecorationImage(
    image: AssetImage(_themeProvider.path!),
    fit: BoxFit.cover,
    ),),
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150,),
                 Container(
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
                     padding:  EdgeInsets.symmetric(vertical:height*.03,horizontal: width*.02),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: height*.03,),
                         MyTextField(hinttext: 'Email',controllerValue: email_controller,),
                         SizedBox(height: 20,),
                         MyTextField(hinttext: 'Password',controllerValue: password_controller,),
                         Row(
                           children: [
                             Checkbox(
                               side: BorderSide(color: _themeProvider.primaryColorLight),
                               checkColor: _themeProvider.primaryColorLight,
                               activeColor: Color(0xff8e8c8c).withOpacity(0.3),
                               value: this.isChecked,
                               onChanged: ( value) {
                                 setState(() {
                                   this.isChecked = value!;
                                 });
                               },
                             ),
                              Text("Remember me",
                                 style: TextStyle(
                                   fontFamily: 'SourceSansPro',
                                   color: _themeProvider.primaryColorLight,
                                   fontSize: 13,
                                   fontWeight: FontWeight.w600,
                                   fontStyle: FontStyle.normal,


                                 )
                             ),SizedBox(height: height*.1,)
                           ],
                         ),
                         InkWell(
                             onTap:(){
                               Navigator.of(context).push( createRoute(Dashboard()));
                             },
                             child: Button(title: 'Sign in')),
                         SizedBox(height: 15,),
                         InkWell(
                           onTap: (){
                             Navigator.of(context).push( createRoute(ForgetPassword()));
                           },
                           child: Text("Forget password",
                               style: TextStyle(
                                 fontFamily: 'SourceSansPro',
                                 color:_themeProvider.primaryColorLight,
                                 fontSize: 13,
                                 fontWeight: FontWeight.w600,
                                 fontStyle: FontStyle.normal,


                               )
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
      ),
    );
  }
}
