import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/model/article_model.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/widgets/button.dart';

import 'dart:io';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../../widgets/my_text_field.dart';
import '../notification.dart';

class EditArticle extends StatefulWidget {
  Article article;

  EditArticle({required this.article});

  @override
  State<EditArticle> createState() => _EditArticleState();
}

class _EditArticleState extends State<EditArticle> {
  TextEditingController title_controller = TextEditingController();
  TextEditingController category_controller = TextEditingController();
  TextEditingController tag_controller = TextEditingController();
  TextEditingController text_controller = TextEditingController();
  bool status = false;
  bool isChecked = false;
  File? file;
  PickedFile? imageFile = null;
  List<String> tags = ['tag1', 'tag2', 'tag3', 'tag4'];
  String selected_tag = '';
  List<String> selected_tages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.isChecked = widget.article.privacy;
    this.status = widget.article.status;
    title_controller.text = widget.article.name;
    category_controller.text = widget.article.category!;
    text_controller.text = widget.article.description;
    selected_tages = widget.article.selected_tages;
    imageFile = widget.article.imageFile;
    file = widget.article.file;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus;
        currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: _themeProvider.primaryColor,
          foregroundColor: _themeProvider.primaryColorLight,
          title: Text('SVITSM',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: _themeProvider.primaryColorLight,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.15,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute(NotificationScreen()));
                },
                icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute(ProfileSettings()));
                },
                icon: Icon(
                  Icons.account_circle,
                  size: 27,
                ))
          ],
        ),
        drawer: Container(width: width * .7, child: DrawerPage()),
        body: Container(
          width: width,
          height: height,
          decoration: _themeProvider.path == null
              ? BoxDecoration(
                  color: _themeProvider.backgroundColor,
                )
              : BoxDecoration(
                  color: _themeProvider.backgroundColor,
                  image: DecorationImage(
                    image: AssetImage(_themeProvider.path!),
                    fit: BoxFit.cover,
                  ),
                ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * .01, horizontal: width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * .01, horizontal: width * .04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: _themeProvider.primaryColorLight,
                            )),
                        SizedBox(
                          width: width * .15,
                        ),
                        Text('Edit Article',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: _themeProvider.primaryColorLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.15,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: 3,
                              color: _themeProvider
                                  .white_color, // Color(0xff2c2b2b)
                            ),
                            bottom: BorderSide(
                                width: 3,
                                color: _themeProvider.light_border_color),
                            left: BorderSide(
                                width: 3,
                                color: _themeProvider.light_border_color),
                            right: BorderSide(
                                width: 3,
                                color: _themeProvider.light_border_color))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * .02, vertical: height * .01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              imageFile == null
                                  ? InkWell(
                                      onTap: () async {
                                        final pickedFile =
                                            await ImagePicker().getImage(
                                          source: ImageSource.gallery,
                                        );
                                        setState(() {
                                          imageFile = pickedFile!;
                                        });
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: width * .36,
                                        height: height * .04,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _themeProvider
                                                    .primaryColorLight),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * .01),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Feature Image',
                                                  style: TextStyle(
                                                      color: _themeProvider
                                                          .primaryColorLight),
                                                ),
                                                Icon(
                                                  Icons.attachment_outlined,
                                                  color: _themeProvider
                                                      .primaryColorLight,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        width: width * .35,
                                        height: height * .04,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _themeProvider
                                                    .primaryColorLight),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * .01),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      imageFile!.path
                                                          .split('/')
                                                          .last,
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * .034),
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                              InkWell(
                                                  onTap: () {
                                                    imageFile = null;
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: _themeProvider
                                                        .primaryColorLight,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                              file == null
                                  ? InkWell(
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                                // type: FileType.custom,
                                                // allowedExtensions: ['jpg', 'pdf', 'doc'],
                                                );

                                        if (result != null) {
                                          file =
                                              File(result.files.single.path!);
                                        } else {
                                          // User canceled the picker
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: width * .34,
                                        height: height * .04,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _themeProvider
                                                    .primaryColorLight),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * .02),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Attach File',
                                                  style: TextStyle(
                                                      color: _themeProvider
                                                          .primaryColorLight),
                                                ),
                                                Icon(
                                                  Icons.attachment_outlined,
                                                  color: _themeProvider
                                                      .primaryColorLight,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        width: width * .35,
                                        height: height * .04,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _themeProvider
                                                    .primaryColorLight),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * .01),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      file!.path
                                                          .split('/')
                                                          .last,
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * .034),
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                              InkWell(
                                                  onTap: () {
                                                    file = null;
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: _themeProvider
                                                        .primaryColorLight,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          custom_text('Article Title', height, _themeProvider),

                          MyTextField(
                            hinttext: 'Enter Article Title',
                            controllerValue: title_controller,
                          ),
                          custom_text(
                              'Enter Article Category', height, _themeProvider),
                          MyTextField(
                            hinttext: 'Enter Article Category',
                            controllerValue: category_controller,
                          ),

                          custom_text('Tags', height, _themeProvider),
                          //    MyTextField(hinttext: 'Enter Tags',controllerValue: tag_controller,),
                          ////////////////////////////////////////////////////////////////////////////

                          TypeAheadFormField(
                            direction: AxisDirection.up,
                            textFieldConfiguration: TextFieldConfiguration(
                              onTap: () {
                                // ge items
                              },
                              style: TextStyle(
                                  color: _themeProvider.primaryColorLight),
                              controller: tag_controller,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: _themeProvider.primaryColorLight,
                                ),
                                fillColor: _themeProvider.textfieldColor,
                                contentPadding: EdgeInsets.all(5),
                                isDense: true,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: _themeProvider.primaryColor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: _themeProvider.primaryColor,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: _themeProvider.primaryColor,
                                    )),
                                hintText: 'Enter tag',
                                hintStyle: TextStyle(
                                    color: _themeProvider.primaryColorLight
                                        .withOpacity(0.5)),
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              return tags.where((element) => element
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()));
                            },
                            itemBuilder: (_, ittem) => ListTile(
                              title: Text(ittem.toString()),
                            ),
                            onSuggestionSelected: (val) {
                              setState(() {
                                selected_tag = val.toString();
                                //alert*********************************************************************************************
                                selected_tages.add(selected_tag);
                              });
                            },
                            getImmediateSuggestions: true,
                            hideSuggestionsOnKeyboardHide: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please select ';
                              }
                            },
                          ),
                          SizedBox(
                            height: height * .01,
                          ),

                          GridView.count(
                              shrinkWrap: true,
                              childAspectRatio: 2.5,
                              crossAxisCount: 5,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              children:
                                  List.generate(selected_tages.length, (index) {
                                return Container(
                                  width: width * .35,
                                  height: height * .02,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              _themeProvider.primaryColorLight),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * .01,
                                        vertical: height * 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          selected_tages[index],
                                          style:
                                              TextStyle(fontSize: width * .034),
                                        )),
                                        InkWell(
                                            onTap: () {
                                              selected_tages.remove(
                                                  selected_tages[index]);
                                              //if added tag added before alert
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: _themeProvider
                                                  .primaryColorLight,
                                              size: 18,
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              })),

                          ///////////////////////////////////////////////////////////////////////////
                          Row(
                            children: [
                              //      Expanded(child: child)
                            ],
                          ),
                          custom_text(
                              'Article Description', height, _themeProvider),

                          Center(
                            child: Container(
                              width: width * .8,
                              height: height * .17,
                              decoration: BoxDecoration(
                                  color: _themeProvider.box_description,
                                  border: Border.all(
                                      color: _themeProvider.primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                style: TextStyle(
                                    color: _themeProvider.primaryColorLight),
                                keyboardType: TextInputType.multiline,
                                maxLines: 1000,
                                controller: text_controller,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(height * .02),
                                  labelText: 'Enter Article Description',
                                  labelStyle: TextStyle(
                                      color: _themeProvider.primaryColorLight
                                          .withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custom_text('Status', height, _themeProvider),
                              SizedBox(
                                width: width * .04,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * .01),
                                child: Container(
                                  child: FlutterSwitch(
                                    activeText: '',
                                    inactiveText: '',
                                    width: width * .14,
                                    inactiveColor:
                                        _themeProvider.textfieldColor,
                                    activeColor: _themeProvider.primaryColor,
                                    height: height * .03,
                                    toggleColor: status == false
                                        ? _themeProvider.primaryColorLight
                                            .withOpacity(0.5)
                                        : _themeProvider.primaryColorLight,
                                    inactiveSwitchBorder: Border.all(
                                        color: _themeProvider.backgroundColor),
                                    valueFontSize: 15.0,
                                    activeSwitchBorder: Border.all(
                                        color: _themeProvider.backgroundColor),
                                    toggleSize: 17,
                                    value: status,
                                    borderRadius: 30.0,
                                    padding: 5.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        status = val;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              status
                                  ? custom_text(
                                      'Publish', height, _themeProvider)
                                  : SizedBox()
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                side: BorderSide(
                                    color: _themeProvider.primaryColorLight),
                                checkColor: _themeProvider.primaryColorLight,
                                activeColor: Color(0xff8e8c8c).withOpacity(0.3),
                                value: this.isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    this.isChecked = value!;
                                  });
                                },
                              ),
                              Text("Privacy mode",
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: _themeProvider.primaryColorLight,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Button(title: 'Save')
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

custom_text(String title, height, ThemeProvider provider) {
  return Padding(
    padding: EdgeInsets.only(bottom: height * .02, top: height * .01),
    child: Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: provider.primaryColorLight,
          fontFamily: 'Source Sans Pro',
          fontSize: 17,
          letterSpacing:
              0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.w500,
          height: 1),
    ),
  );
}
