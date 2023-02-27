import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/widgets/theme_data.dart';

import '../../controller/provider/theme_provider.dart';

class MyTextField extends StatefulWidget {
  String hinttext='';
  TextEditingController controllerValue;
  MyTextField({required this.hinttext,required this.controllerValue});
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);
    return  Container(
        width: width*82,
        height: height*.045,
      child: TextFormField(
        style: TextStyle(color: _themeProvider.primaryColorLight),
        controller: widget.controllerValue,
      decoration: InputDecoration(fillColor:_themeProvider.textfieldColor,filled: true,
        contentPadding: EdgeInsets.all(5),
        hintText: widget.hinttext,
        hintStyle: TextStyle(color:_themeProvider.primaryColorLight.withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color:_themeProvider.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color:_themeProvider.primaryColor,
            )),
      ),
    ),
    );
  }
}
