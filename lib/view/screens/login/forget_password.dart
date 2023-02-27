import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/theme_provider.dart';
import '../../widgets/button.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/theme_data.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email_controller=TextEditingController();

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
        body: Container(width:width,height:height,
         decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
          BoxDecoration(
            color:_themeProvider. backgroundColor,
            image:  DecorationImage(
              image: AssetImage(_themeProvider.path!),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,)),
                    SizedBox(height: height*.2,),
                  ],
                ),
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
                   padding:  EdgeInsets.symmetric(vertical:height*.05,horizontal: width*.03),

                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: height*.03,),
                       Center(
                         child: Text("Forget your password?",
                             style: TextStyle(
                                 fontFamily: 'SourceSansPro',
                                 color: _themeProvider.primaryColorLight,
                                 fontSize: 20,
                                 fontWeight: FontWeight.w600,
                                 fontStyle: FontStyle.normal
                             )
                         ),
                       ),SizedBox(height: height*.03,),
                       new Text("Please, Enter the email address that is linked to your account.\r",
                           style: TextStyle(
                             fontFamily: 'SourceSansPro',
                             color:_themeProvider.primaryColorLight,
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             fontStyle: FontStyle.normal,


                           )
                       ),SizedBox(height: height*.05,),
                       MyTextField(hinttext: 'Email',controllerValue: email_controller,),
                       SizedBox(height: height*.06,),

                       InkWell(
                           onTap: (){
                             //  Navigator.of(context).push( createRoute(ForgetPassword()));
                           },
                           child: Button(title: 'Submit')),
                     ],
                   ),
                 ),
               )

              ],
    )),
        )));
  }
}
