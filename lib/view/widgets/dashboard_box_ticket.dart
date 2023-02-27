import 'package:flutter/material.dart';
import 'package:ticketing_system/controller/provider/theme_provider.dart';
import 'package:ticketing_system/view/widgets/theme_data.dart';


boxTicket(title,number,icon,double height,double width,ThemeProvider provider,{ bool admin=false}){
  return Center(child: Container(margin: EdgeInsets.only(left: admin?width*.03:width*.01),
    padding: EdgeInsets.symmetric(horizontal:admin?width*.02:width*.001),
    height: admin?height*.15:height*.09,
    width: admin?width*.8:width*.41,
    decoration: BoxDecoration(
      color: provider.backgroundColor.withOpacity(0.4),
        boxShadow: <BoxShadow>[

        ],
      //  borderRadius: BorderRadius.circular(5),
        border: Border(
            top: BorderSide( width: 3,color:provider.white_color, // Color(0xff2c2b2b)
   )     , bottom: BorderSide( width: 3,color:provider.light_border_color, ),
            left: BorderSide( width: 3,color:provider.light_border_color ),
          right: BorderSide( width: 3,color:provider.light_border_color, )
        )
    ),child: Padding(
    padding: const EdgeInsets.all(3.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title,
                  style:  TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: provider.primaryColorLight,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,

                  )
              ),  Text(number.toString(),  style:  TextStyle(
                fontFamily: 'SourceSansPro',
                color: provider.primaryColorLight,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,

              ))
            ],
          ),
        ),  Container(
            width: width*.09,
            height: height*.08,
            padding: EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color(0xdbd9d9d9),
                  Color(0xdbd9d9d9) ],
                    // stops: [
                    //   0.0520833320915699,
                    //   1
                    // ]
                )
            ),child: Center(child: icon,)),
      ],
    ),
  ),
  ),);
}