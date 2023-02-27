import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/screens/tickets/create_ticket.dart';
import 'package:ticketing_system/view/widgets/button.dart';
import 'dart:io';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../../model/ticket_model.dart';
import '../../widgets/drawer.dart';
import '../../widgets/theme_data.dart';
import '../conversation.dart';
import '../notification.dart';

class TicketDetail extends StatefulWidget {
  Ticket? ticket;

  TicketDetail({required this.ticket});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  File? file;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);
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
          width:width,height:height,
          decoration: _themeProvider.path==null?BoxDecoration(color:_themeProvider. backgroundColor,):
          BoxDecoration(
            color:_themeProvider. backgroundColor,
            image:  DecorationImage(
              image: AssetImage(_themeProvider.path!),
              fit: BoxFit.cover,
            ),),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,)),
                        SizedBox(
                          width: width * .15,
                        ),
                        Text('Ticket Details',
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
                              width: 3, color: _themeProvider.white_color, // Color(0xff2c2b2b)
                            ),
                            bottom:
                                BorderSide(width: 3, color: _themeProvider.light_border_color),
                            left:
                                BorderSide(width: 3, color: _themeProvider.light_border_color),
                            right: BorderSide(
                                width: 3, color: _themeProvider.light_border_color))),
                    child: Padding(
                      padding:  EdgeInsets.all(width*.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              custom_text(widget.ticket!.title, height, width,_themeProvider),
                              SizedBox(
                                width: width * .05,
                              ),
                              Text(
                                '(Last update on 20 sec)',
                                style: TextStyle(color: _themeProvider.primaryColorLight.withOpacity(0.599)),
                              ),
                            ],
                          ),
                          custom_text('Ticket Description', height, width,_themeProvider),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .03),
                            child: Text(widget.ticket!.description,style: TextStyle(color: _themeProvider.primaryColorLight),),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                        ],
                      ),
                    ),
                  ),SizedBox(height: height*.02,),
                  //   Divider(color: Colors.white,height: height*.01,thickness: height*.006,),
                  Container(
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
                      padding:  EdgeInsets.all(width*.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          custom_text('Ticket Information', height, width,_themeProvider),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * .1),
                            child: Column(
                              children: [
                                rowdetail('Ticket ID', height, width, '#SP-76',_themeProvider),
                                rowdetail(
                                    'Ticket Category', height, width, '#SP-76',_themeProvider),
                                widget.ticket?.sub_category == null
                                    ? SizedBox()
                                    : rowdetail('Ticket Sub - Category', height,
                                        width, widget.ticket!.sub_category,_themeProvider),
                                widget.ticket?.project == null
                                    ? SizedBox()
                                    : rowdetail('Project', height, width,
                                        widget.ticket!.project,_themeProvider),
                                rowdetail('Open Date', height, width,
                                    widget.ticket!.date,_themeProvider),
                                rowdetail('Ticket Status', height, width,
                                    widget.ticket!.status,_themeProvider),
                                rowdetail('Attached File', height, width, 'fg',_themeProvider),
                                widget.ticket?.category == null
                                    ? SizedBox()
                                    : rowdetail('Ticket Sub - Category', height,
                                        width, 'fg',_themeProvider),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push( createRoute(ConversationScreen()));
                      },
                      child: Button(title: 'Conversations')),
                  SizedBox(
                    height: height * .01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(createRoute(CreateTicket()));
                    },
                    child: Container(
                        width: width * 81,
                        height: height * .046,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _themeProvider.primaryColorLight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text('Create New Ticket +',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: _themeProvider.primaryColorLight,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                        )),
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

rowdetail(title, height, width, info,ThemeProvider provider) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height * .01),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: provider.primaryColorLight,
              fontFamily: 'Source Sans Pro',
              fontSize: 15,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w500,
              height: 1),
        ),
        Text(info,style: TextStyle(color: provider.primaryColorLight),)
      ],
    ),
  );
}

custom_text(String title, height, width,ThemeProvider provider) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height * .01),
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
