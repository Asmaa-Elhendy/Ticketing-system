import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/widgets/button.dart';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../../widgets/theme_data.dart';
import '../notification.dart';
import 'change_image.dart';

class DeactiveAccount extends StatefulWidget {
  @override
  State<DeactiveAccount> createState() => _DeactiveAccountState();
}

class _DeactiveAccountState extends State<DeactiveAccount> {
  Color black_color = Color(0xff2c2b2b);

  Color purple = Color(0xffd8cfed);
  bool isCkecked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeProvider.primaryColor,
        foregroundColor: _themeProvider.primaryColorLight,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            color:_themeProvider.primaryColorLight,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(NotificationScreen()));
              },
              icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      drawer: Container(width: width * .7, child: DrawerPage()),
      body: Container(width:width,height:height,
    decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
    BoxDecoration(
    color:_themeProvider. backgroundColor,
    image:  DecorationImage(
    image: AssetImage(_themeProvider.path!),
    fit: BoxFit.cover,
    ),),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * .09,
              color: _themeProvider.primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: height * .01,
                  ),
                ],
              ),
            ),
            Positioned(
              left: width * .01,
              top: height * .03,
              child: IconButton(
                  icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),    Positioned(
                left: width*.39,
                right: width*.4,
                top:height*.03,child: CircleAvatar(radius: width*.1,backgroundColor: black_color,)),
            Positioned(
                left: width*.33,
                //  right: width*.4,
                top:height*.16,child: InkWell(
                onTap: (){
                  Navigator.of(context).push( createRoute(ChangeImage()));
                },
                child: Text('Change Your Image',style: TextStyle(color: _themeProvider.primaryColorLight),))),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .04, vertical: height * .023),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * .18,
                  ),
            Container(
              decoration: BoxDecoration(
                //   color: Color(0xffe4eef3),
                //  border: Border.all(color:Color(0xff8e8c8c),),
                  border: Border(
                      top: BorderSide( width: 3,color:_themeProvider.white_color, // Color(0xff2c2b2b)
                      )     , bottom: BorderSide( width: 3,color:_themeProvider.light_border_color ),
                      left: BorderSide( width: 3,color:_themeProvider.light_border_color ),
                      right: BorderSide( width: 3,color:_themeProvider.light_border_color )
                  )
                //    borderRadius:BorderRadius.circular(8),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: width * .03, vertical: height * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*.01,),
                      Text(
                    'Deactivate Account',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: _themeProvider.primaryColorLight,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18,
                        letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w500,
                        height: 1),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text(
                    'Once you delete your account, you can not access your account with the same credentials. You need to re-register your account.',
                    style: TextStyle(height: 1.5,color: _themeProvider.primaryColorLight),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: height*.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          side: BorderSide(color: _themeProvider.primaryColorLight),
                          checkColor: _themeProvider.primaryColor,
                          activeColor: _themeProvider.primaryColorLight.withOpacity(0.3),
                          value: this.isCkecked,
                          onChanged: (value) {
                            setState(() {
                              this.isCkecked = value!;
                            });
                          },
                        ),
                         Text(
                            "I have read and agree to the Terms of services ",
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: _themeProvider.primaryColorLight,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                  ),
                ],),
              ),
            ),SizedBox(height: height*.02,),
                  InkWell(
                    onTap: (){},
                    child: Button(title: 'Deactivate Account',),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
