import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/projects_provider.dart';
import 'package:ticketing_system/controller/provider/subcategories_provider.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/widgets/button.dart';

import 'dart:io';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/theme_data.dart';
import '../notification.dart';

class CreateTicket extends StatefulWidget {

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {

  // Color black_color= Color(0xff2c2b2b);

  TextEditingController title_controller=TextEditingController();
  TextEditingController text_controller=TextEditingController();
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
          child: SingleChildScrollView(
            child: Padding(
            padding:  EdgeInsets.symmetric(vertical: height*.01,horizontal: width*.04),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: height*.01,horizontal: width*.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,)),
                      SizedBox(width: width*.15,),
                      Text('Create Ticket',
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
                    padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: width*.27,),
                          file==null? InkWell(
                            onTap: ()async{
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                // type: FileType.custom,
                                // allowedExtensions: ['jpg', 'pdf', 'doc'],
                              );

                              if (result != null) {
                                file = File(result.files.single.path!);
                              } else {
                                // User canceled the picker
                              }
                              setState(() {});
                            },
                            child: Container(
                              width: width*.28,
                              height: height*.04,
                              decoration: BoxDecoration(
                                  border: Border.all(color: _themeProvider.primaryColorLight),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal:width*.01),
                                child: Row(
                                  children: [
                                    Text('Attach File',style: TextStyle(color: _themeProvider.primaryColorLight),),
                                    Icon(Icons.attachment_outlined,color: _themeProvider.primaryColorLight,)
                                  ],
                                ),
                              ),
                            ),
                          ):Expanded(
                            child: Container(
                              width: width*.35,
                              height: height*.04,
                              decoration: BoxDecoration(
                                  border: Border.all(color: _themeProvider.primaryColorLight),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal:width*.01),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(file!.path.split('/').last,style: TextStyle(fontSize: width*.034),overflow: TextOverflow.ellipsis)),
                                    InkWell(
                                        onTap: (){
                                          file=null;
                                          setState(() {

                                          });
                                        },
                                        child: Icon(Icons.clear,color: _themeProvider.primaryColorLight,))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],),
                      custom_text('Ticket Title',height,_themeProvider),

                      MyTextField(hinttext: 'Enter Ticket Title',controllerValue: title_controller,),

                      custom_text('Ticket Category',height,_themeProvider),

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
                                    // get api subcategories & get api projects
                                    // length>=1 then list subcategories provider
                                    // length>=1 then list projects provider
                                    setState(() {});
                                  },
                                  value: dropdownvalue,
                                  decoration: InputDecoration.collapsed(


                                      fillColor: Colors.grey[200],

                                      hintText: 'Enter Ticket Category',
                                      hintStyle: TextStyle(color:_themeProvider.primaryColorLight.withOpacity(0.5))
                                    //   errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                                  )))),

                      subcategory_provider.SubCategories.isNotEmpty?custom_text('Ticket Sub Category',height,_themeProvider):SizedBox(),

                      subcategory_provider.SubCategories.isNotEmpty? Container(
                          height: height * .05,
                          width: width * .9,
                          decoration: BoxDecoration(
                              color: _themeProvider.backgroundColor,
                              border: Border.all(color: _themeProvider.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                              child: DropdownButtonFormField(
                                  dropdownColor: _themeProvider.backgroundColor,
                                  icon:    Icon(
                                      Icons.arrow_drop_down,
                                      color:_themeProvider.primaryColorLight.withOpacity(0.5))
                                  ,items: subcategory_provider.SubCategories.map((String lang) {
                                return new DropdownMenuItem(
                                    value: lang, child: Text(lang));
                              }).toList(),
                                  onChanged: (String? newValue) {

                                    dropdownvalue2 = newValue!;

                                    setState(() {});
                                  },
                                  value: dropdownvalue2,
                                  decoration: InputDecoration.collapsed(


                                      fillColor: Colors.grey[200],

                                      hintText: 'Enter Ticket sub Category',
                                      hintStyle: TextStyle(color: _themeProvider.primaryColorLight.withOpacity(0.5))
                                    //   errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                                  )))):SizedBox(),

                      project_provider.projects.isNotEmpty?custom_text('Projects',height,_themeProvider):SizedBox(),

                      project_provider.projects.isNotEmpty? Container(
                          height: height * .05,
                          width: width * .9,
                          decoration: BoxDecoration(color: _themeProvider.backgroundColor,
                              border: Border.all(color: _themeProvider.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                              child: DropdownButtonFormField(
                                  dropdownColor: _themeProvider.backgroundColor,
                                  icon:    Icon(
                                      Icons.arrow_drop_down,
                                      color:_themeProvider.primaryColorLight.withOpacity(0.5)),
                                  items: project_provider.projects.map((String lang) {
                                    return new DropdownMenuItem(
                                        value: lang, child: Text(lang));
                                  }).toList(),
                                  onChanged: (String? newValue) {

                                    dropdownvalue3 = newValue!;
                                    // get api subcategories & get api projects
                                    // length>=1 then list subcategories provider
                                    // length>=1 then list projects provider
                                    setState(() {});
                                  },
                                  value: dropdownvalue3,
                                  decoration: InputDecoration.collapsed(


                                      fillColor: Colors.grey[200],

                                      hintText: 'Enter Ticket project',
                                      hintStyle: TextStyle(color: _themeProvider.primaryColorLight.withOpacity(0.5))
                                    //   errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                                  )))):SizedBox(),

                      custom_text('Text Description',height,_themeProvider),

                      Center(
                        child: Container(
                          width: width*.8,
                          height: height*.17,
                          decoration: BoxDecoration(
                              color: _themeProvider.box_description,
                              border: Border.all(color: _themeProvider.primaryColor),
                              borderRadius: BorderRadius.circular(10)
                          ),child: TextField(
                          style: TextStyle(color: _themeProvider.primaryColorLight),
                          keyboardType: TextInputType.multiline,
                          maxLines: 1000,
                          controller: text_controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(height*.02),
                            labelText: 'Enter Text Description',
                            labelStyle: TextStyle(color: _themeProvider.primaryColorLight.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                        ),
                      ),SizedBox(height: height*.02,),
                      Button(title: 'Create Ticket')
                    ],),
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