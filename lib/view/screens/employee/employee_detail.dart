import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/projects_provider.dart';
import 'package:ticketing_system/controller/provider/subcategories_provider.dart';
import 'package:ticketing_system/model/employee.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/widgets/button.dart';

import 'dart:io';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../../widgets/my_text_field.dart';
import '../notification.dart';

class EmployeeDetail extends StatefulWidget {
Employee employee;
EmployeeDetail({required this.employee});
  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {

  // Color black_color= Color(0xff2c2b2b);

  TextEditingController first_name_controller=TextEditingController();
  TextEditingController last_name_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  TextEditingController employee_id_controller=TextEditingController();
  TextEditingController mobile_number_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  TextEditingController skills_controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    first_name_controller..text=widget.employee.first_name;
    last_name_controller..text=widget.employee.last_name;
    employee_id_controller..text=widget.employee.emp_id;
    password_controller..text=widget.employee.password;
    mobile_number_controller..text=widget.employee.mobile_number;
    email_controller..text=widget.employee.email;
    skills_controller..text=widget.employee.skills;
  }
  var items = [
    'Category 1',
    'Category 2',
  ];
  String? dropdownvalue;
  String? dropdownvalue2;
  String? dropdownvalue3;
  File? file;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    var selectedPageNumber = 3;
    SubCategoriesProvider subcategory_provider=Provider.of<SubCategoriesProvider>(context);
    ProjectsProvider project_provider=Provider.of<ProjectsProvider>(context);
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
                        SizedBox(width: width*.1,),
                        Text('Employee Details',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color:_themeProvider.primaryColorLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.15,

                            )
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

                          custom_text('First Name',height,_themeProvider),

                          MyTextField(hinttext:'First Name',controllerValue: first_name_controller,),

                          custom_text('Last Name',height,_themeProvider),

                          MyTextField(hinttext:'Last Name',controllerValue: last_name_controller,),
                          custom_text('Employee ID',height,_themeProvider),
                          MyTextField(hinttext:'Employee ID',controllerValue: employee_id_controller,),
                          custom_text('Role',height,_themeProvider),
                          Container(
                              height: height * .05,
                              width: width * .9,
                              decoration: BoxDecoration(color: _themeProvider.backgroundColor,
                                  border: Border.all(color: _themeProvider.primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                                  child: DropdownButtonFormField(
                                      icon:    Icon(
                                          Icons.arrow_drop_down,
                                          color:_themeProvider.primaryColorLight.withOpacity(0.5)),
                                      dropdownColor: _themeProvider.backgroundColor,
                                      items: items.map((String lang) {
                                        return new DropdownMenuItem(
                                            value: lang, child: Text(lang));
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if(newValue=='Category 2'){
                                          List<String> return_sub_category_list=['sub1','sub2','sub3'];
                                          List<String> return_project_list=['project1','project2','project3'];
                                          subcategory_provider.setSubCategories(return_sub_category_list);
                                          project_provider.setProjects(return_project_list);

                                        }else{
                                          subcategory_provider.setSubCategories([]);
                                          project_provider.setProjects([]);
                                        }

                                        dropdownvalue = newValue!;

                                        setState(() {});
                                      },
                                      value: dropdownvalue,
                                      decoration: InputDecoration.collapsed(


                                          fillColor: Colors.grey[200],

                                          hintText: 'Select Role',
                                          hintStyle: TextStyle(color:_themeProvider.primaryColorLight.withOpacity(0.5))
                                        //   errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                                      )))),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custom_text('Password',height,_themeProvider),
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: height*.01,horizontal: width*.02),
                                child: Text('(please, copy and save it)',style: TextStyle(color: _themeProvider.primaryColorLight),),
                              )
                            ],),
                          MyTextField(hinttext:'Password',controllerValue: password_controller,),
                          custom_text('Mobile Number',height,_themeProvider),
                          MyTextField(hinttext:'Mobile Number',controllerValue: mobile_number_controller,),
                          custom_text('Email',height,_themeProvider),
                          MyTextField(hinttext:'Email',controllerValue: email_controller,),
                          custom_text('Skills',height,_themeProvider),
                          MyTextField(hinttext:'Skills',controllerValue: skills_controller,),
                          SizedBox(height: height*.01,),
                          Button(title: 'Save')
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