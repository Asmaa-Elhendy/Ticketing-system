import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/button.dart';
import '../../widgets/drawer.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/theme_data.dart';
import '../notification.dart';

class ChangeImage extends StatefulWidget {
  @override
  State<ChangeImage> createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {
  PickedFile? imageFile = null;
  PickedFile? newimageFile = null;

  // Color black_color = Color(0xff2c2b2b);
  //
  // Color purple = Color(0xffd8cfed);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeProvider.primaryColor, foregroundColor: _themeProvider.primaryColorLight, elevation: 0,
        title: Text('Profile', style: TextStyle(
          fontFamily: 'SourceSansPro',
          color: _themeProvider.primaryColorLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,

        ),),actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push( createRoute(NotificationScreen()));
        }, icon: Icon(Icons.notifications)),
        IconButton(onPressed: (){}, icon: Icon(Icons.search))
      ],),
      drawer:Container(
          width: width*.7,
          child: DrawerPage()
      ),
      body: Container(width:width,height:height,
    decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
    BoxDecoration(
    color:_themeProvider. backgroundColor,
    image:  DecorationImage(
    image: AssetImage(_themeProvider.path!),
    fit: BoxFit.cover,
    )),
        child: Stack(children: [

          Container(width: width, height: height * .09, color: _themeProvider.primaryColor,
            child: Column(children: [
              SizedBox(height: height * .01,),

            ],),
          ),
          Positioned(
            left: width * .01,

            top: height * .03,
            child: IconButton(icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight), onPressed: () {
              Navigator.pop(context);
            }),),
          Positioned(
              left: width * .39,
              right: width * .4,
              top: height * .03,
              child: CircleAvatar(
                radius: width * .1,
                backgroundColor: _themeProvider.box_description,
              //  child:Center(child: Icon(Icons.image),),
                 child: newimageFile!=null?ClipOval(child: Image.file(File(newimageFile!.path),fit: BoxFit.cover,width:width*.2,
                   height:width*.2,)):Center(child: Icon(Icons.image,color: _themeProvider.primaryColorLight,),),


              )),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * .07, vertical: height * .01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * .15,),
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
                   padding: EdgeInsets.symmetric(
                       horizontal: width * .03, vertical: height * .01),
                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: height*.02,),
                     Text(
                       'Change Image', textAlign: TextAlign.left, style: TextStyle(
                         color: _themeProvider.primaryColorLight,
                         fontFamily: 'Source Sans Pro',
                         fontSize: 18,
                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                         fontWeight: FontWeight.w500,
                         height: 1
                     ),), SizedBox(height: height * .03,),
                     Text('Upload Your Image', textAlign: TextAlign.left,
                       style: TextStyle(
                           color: _themeProvider.primaryColorLight,
                           fontFamily: 'Source Sans Pro',
                           fontSize: 18,
                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                           fontWeight: FontWeight.w500,
                           height: 1
                       ),), SizedBox(height: height * .02,),
                     InkWell(
                       onTap: (){
                         _showChoiceDialog(context,_themeProvider);
                       },
                       child: Container(
                         width: width * .8,
                         height: height * .3,
                         decoration: BoxDecoration(color: _themeProvider.box_description,
                           borderRadius: BorderRadius.circular(8),
                           border: Border.all(color: _themeProvider.primaryColor),
                         ), child:imageFile!=null?Image.file(File(imageFile!.path),fit: BoxFit.cover,): Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Upload Your Image Here',style: TextStyle(color: _themeProvider.primaryColorLight),),
                           Icon(Icons.upload_outlined,color: _themeProvider.primaryColorLight,)
                         ],),
                       ),
                     ),
                     SizedBox(height: height * .01,),
                     Text('The File sould not be more than 5 mb',
                       style: TextStyle(color: _themeProvider.primaryColorLight),),
                     SizedBox(height: height * .01,)
                   ],),
                 ),
               ),  SizedBox(height: height * .04,),
                InkWell(
                    onTap: (){
                      imageFile!=null?newimageFile=imageFile:newimageFile=null;
                      setState(() {

                      });
                    },
                    child: Button(title: 'Save',))
              ],
            ),
          )

        ],),
      )
      ,
    );
  }

  TextTile(title, height) {
    return Padding(
      padding: EdgeInsets.only(top: height * .03, bottom: height * .01),
      child: Text(title, textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Source Sans Pro',
          fontSize: 16,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.w500,
          height: 1
      ),),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context,ThemeProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Photo From:"),
            elevation: 20,
            actions: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          _openCamera(context);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Camera Roll',
                          style:
                          TextStyle(color: provider.primaryColor),
                        )),
                    TextButton(
                        onPressed: () {
                          _openGallery(context);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Gallery',
                          style:
                          TextStyle(color: provider.primaryColor),
                        )),
                  ],
                ),
              ),
            ],
          );
        });
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
  }
}