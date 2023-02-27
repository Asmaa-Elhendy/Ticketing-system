
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketing_system/view/screens/login/forget_password.dart';
import 'package:ticketing_system/view/screens/login/login_screen.dart';
import 'package:ticketing_system/view/widgets/drawer.dart';

import 'dashboard.dart';
class Home extends StatefulWidget {
  int bottomNavIndex;
  Home({ this.bottomNavIndex=0});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

Color black_color= Color(0xff2c2b2b);
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    List<Widget> pages=[Dashboard(),ForgetPassword(),LoginScreen(),LoginScreen()];
    List<String> titles=['SVITSM','Search','export','settings'];
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffd8cfed),foregroundColor: black_color,
      title:  Text(titles[widget.bottomNavIndex],
          style: TextStyle(
            fontFamily: 'Roboto',
            color:black_color,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.15,

          )
      ),
      ),
      drawer: Container(
        width: width*.7,
        child: DrawerPage()
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },child: Icon(Icons.add),
        backgroundColor:  Color(0xffd8cfed),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  AnimatedBottomNavigationBar(
        backgroundColor: Color(0xffd8cfed),
        activeColor: Color(0xff2c2b2b),
        icons: [Icons.dashboard,Icons.search,Icons.download,Icons.settings],
        activeIndex: widget.bottomNavIndex,
        inactiveColor: Color(0xff7e8080),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => widget.bottomNavIndex = index),
        //other params
      ),body: pages[widget.bottomNavIndex],
    );
  }
}
