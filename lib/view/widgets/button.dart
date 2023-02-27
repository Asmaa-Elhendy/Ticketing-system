import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/widgets/theme_data.dart';

import '../../controller/provider/theme_provider.dart';


class Button extends StatefulWidget {
 String title='';
 Button({required this.title});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);
    return  Container(
        width: width*81,
        height: height*.046,
        decoration: BoxDecoration(
          color: _themeProvider.primaryColor,
          borderRadius:BorderRadius.circular(8),

        ),
        child:  Center(
          child: Text(widget.title,
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: _themeProvider.primaryColorLight,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,


              )
          ),
        )
    );
  }
}
