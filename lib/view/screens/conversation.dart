import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/model/message_model.dart';
import 'package:ticketing_system/view/screens/conversation/inner_chat.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/widgets/button.dart';
import '../../../controller/page_route.dart';
import '../../controller/provider/admin_provider.dart';
import '../../controller/provider/theme_provider.dart';
import '../widgets/drawer.dart';
import '../widgets/message_chat.dart';
import 'notification.dart';

class ConversationScreen extends StatefulWidget {
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController text_controller = TextEditingController();
  String my_mail = 'asmaa@gmail.com';
  List<MessageModel> messages = [
    MessageModel(
        message:
            'Hi Sir 👋Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, ',
        date: '4/11/2022',
        email: 'asmaa2@gmail.com'),
    MessageModel(
        message:
            'Hi Sir 👋Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, ',
        date: '4/11/2022',
        email: 'asmaa@gmail.com'),
    MessageModel(
        message:
            'Hi Sir 👋Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, ',
        date: '4/11/2022',
        email: 'asmaa2@gmail.com'),
    MessageModel(
        message:
            'Hi Sir 👋Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, ',
        date: '4/11/2022',
        email: 'asmaa@gmail.com'),
  ];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    AdminProvider _adminprovider =
        Provider.of<AdminProvider>(context, listen: false);

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
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .006),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: _themeProvider.primaryColorLight,
                        ),
                        SizedBox(
                          width: width * .15,
                        ),
                        Text('Conversations',
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
                  SizedBox(
                    height: height * .53,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, i) {
                          bool me = my_mail == messages[i].email;
                          return me
                              ? chat_Me(width, messages[i], true,
                                  _themeProvider, _adminprovider.admin)
                              : chat_Me(width, messages[i], false,
                                  _themeProvider, _adminprovider.admin);
                        }),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reply',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _themeProvider.primaryColorLight),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Container(
                        width: width * .8,
                        height: height * .17,
                        decoration: BoxDecoration(
                            color: _themeProvider.box_description,
                            border:
                                Border.all(color: _themeProvider.primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          style: TextStyle(
                              color: _themeProvider.primaryColorLight),
                          keyboardType: TextInputType.multiline,
                          maxLines: 1000,
                          controller: text_controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: width * .02),
                            labelText: 'Enter Your Reply here',
                            labelStyle: TextStyle(
                                color: _themeProvider.primaryColorLight
                                    .withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * .005,
                  ),
                  Row(
                    mainAxisAlignment: _adminprovider.admin
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      _adminprovider.admin
                          ? InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(createRoute(InnerChat()));
                              },
                              child: Text(
                                'inner chat',
                                style: TextStyle(
                                  color: _themeProvider.primaryColorLight,
                                  decoration: TextDecoration.underline,
                                ),
                              ))
                          : SizedBox(),
                      InkWell(
                        onTap: () {
                          this.messages.add(MessageModel(
                              message: text_controller.text,
                              date: DateTime.now().toString(),
                              email: 'asmaa@gmail.com'));
                          FocusScopeNode currentFocus;
                          currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          setState(() {
                            _scrollController.animateTo(height * .5,
                                duration: const Duration(milliseconds: 1),
                                curve: Curves.fastOutSlowIn);
                            text_controller.clear();
                          });
                        },
                        child: Container(
                            width: width * .3,
                            child: Button(title: 'Send Reply')),
                      ),
                    ],
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
