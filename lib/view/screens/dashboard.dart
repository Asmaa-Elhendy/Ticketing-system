
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/admin_provider.dart';
import 'package:ticketing_system/view/screens/notification.dart';
import 'package:ticketing_system/view/screens/profile_settings/profile_settings.dart';
import 'package:ticketing_system/view/screens/tickets/all_tickets.dart';
import 'package:ticketing_system/view/screens/tickets/ticket_detail.dart';

import '../../controller/page_route.dart';
import '../../controller/provider/theme_provider.dart';
import '../../model/ticket_model.dart';
import '../widgets/dashboard_box_ticket.dart';
import '../widgets/dashboard_ticket_tile.dart';
import '../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Color black_color = Color(0xff2c2b2b);
  List<Ticket> tickets = [
    Ticket(title: 'Ticket 1', status: 'Status', date: '14 Nov 07:06'),
    Ticket(title: 'Ticket 2', status: 'Status', date: '8 Nov 09:00'),
    Ticket(title: 'Ticket 3', status: 'Status', date: '14 Nov 07:06'),

    Ticket(title: 'Ticket 4', status: 'Status', date: '7 Nov 07:15'),
  ];

  @override
  int pageIndex = 0;

  final pageController = PageController(viewportFraction: 1 / 2);

  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    AdminProvider adminProvider = Provider.of<AdminProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: _themeProvider.primaryColor,
        foregroundColor: _themeProvider.primaryColorLight,
        title: Text('SVITSM',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _themeProvider.primaryColorLight,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.15,

            )
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(createRoute(NotificationScreen()));
          }, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {
            Navigator.of(context).push(createRoute(ProfileSettings()));
          }, icon: Icon(Icons.account_circle, size: 27,))
        ],
      ),
      drawer: Container(
          width: width * .7,
          child: DrawerPage()
      ),
      body: Container(
        height: height, width: width,
        decoration: _themeProvider.path == null ? BoxDecoration(
          color: _themeProvider.backgroundColor,) :
        BoxDecoration(
          color: _themeProvider.backgroundColor,
          image: DecorationImage(
            image: AssetImage(_themeProvider.path!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * .02,
            ),
            adminProvider.admin ?
            Column(
              children: [
                Container(height: height * .26,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        // set page index to current index of page
                        pageIndex = index;
                      });
                    },
                    children: [
                      boxTicket(
                          'All Tickets',
                          25,
                          SvgPicture.asset(
                            'assets/images/confirmation_number4.svg',
                            color: _themeProvider.primaryColor,
                          ),
                          height,
                          width, _themeProvider,admin: true), boxTicket(
                              'Active Tickets',
                              15,
                              Icon(
                                Icons.local_activity_outlined,
                                color: _themeProvider.primaryColor,
                              ),
                              height,
                              width, _themeProvider,admin: true),
                      boxTicket(
                                  'Closed Tickets',
                                  8,
                                  SvgPicture.asset(
                                    'assets/images/confirmation_number2.svg',
                                    color: _themeProvider.primaryColor,
                                  ),
                                  height,
                                  width, _themeProvider,admin: true),
                      boxTicket(
                          'Assigned Tickets',
                          25,
                          SvgPicture.asset(
                            'assets/images/confirmation_number3.svg',
                            color: _themeProvider.primaryColor,
                          ),
                          height,
                          width, _themeProvider,admin: true),
                      boxTicket(
                          'My Assign Tickets',
                          25,
                          SvgPicture.asset(
                            'assets/images/confirmation_number3.svg',
                            color: _themeProvider.primaryColor,
                          ),
                          height,
                          width, _themeProvider,admin: true),
                      boxTicket(
                          'My Tickets',
                          25,
                          SvgPicture.asset(
                            'assets/images/my_ticket.svg',
                            color: _themeProvider.primaryColor,
                          ),
                          height,
                          width, _themeProvider,admin: true),
                      boxTicket(
                          'On hold Tickets',
                          25,
                          SvgPicture.asset(
                            'assets/images/confirmation_number.svg',
                            color: _themeProvider.primaryColor,
                          ),
                          height,
                          width, _themeProvider,admin: true),
                      boxTicket(
                          'Overdue Tickets',
                          25,
                          SvgPicture.asset(
                            'assets/images/overdue_ticket.svg',
                            color: _themeProvider.primaryColor,
                          ),
                          height,
                          width, _themeProvider,admin: true),
                    ],
                  ),
                ),
              ],
            )
                : Column(
              children: [
                boxTicket(
                    'All Tickets',
                    25,
                    SvgPicture.asset(
                      'assets/images/confirmation_number4.svg',
                      color: _themeProvider.primaryColor,
                    ),
                    height,
                    width, _themeProvider),
                SizedBox(
                  height: height * .01,
                ),
                boxTicket(
                    'Active Tickets',
                    15,
                    Icon(
                      Icons.local_activity_outlined,
                      color: _themeProvider.primaryColor,
                    ),
                    height,
                    width, _themeProvider),
                SizedBox(
                  height: height * .01,
                ),
                boxTicket(
                    'Closed Tickets',
                    8,
                    SvgPicture.asset(
                      'assets/images/confirmation_number2.svg',
                      color: _themeProvider.primaryColor,
                    ),
                    height,
                    width, _themeProvider),
              ],
            ),
            adminProvider.admin? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 8; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: _indicatorDotsWidget(
                        color: pageIndex == i
                            ? _themeProvider.primaryColorLight
                            : _themeProvider.primaryColorLight.withOpacity(0.5),
                        width: pageIndex == i ? 15 : 6),
                  ),
              ],
            ):SizedBox(),
            SizedBox(height: height * .02,),

            Container(
              width: width * .9, height: height * .52,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 3,
                        color: _themeProvider.white_color, // Color(0xff2c2b2b)
                      ),
                      bottom: BorderSide(
                          width: 3, color: _themeProvider.light_border_color),
                      left: BorderSide(
                          width: 3, color: _themeProvider.light_border_color),
                      right: BorderSide(
                          width: 3, color: _themeProvider.light_border_color)
                  )
                //    borderRadius:BorderRadius.circular(8),
              ), child: Column(children: [
              Container(
                  width: width * .9,
                  height: height * .06,
                  decoration: BoxDecoration(
                    color: _themeProvider.dividerColor,
                    // color: Color(0xffe4eef3),
                    // border: Border.all(color:Color(0xff8e8c8c),),
                    borderRadius: BorderRadius.circular(6),
                  ), child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('All Tickets', style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: _themeProvider.primaryColorLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,

                    ),),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              createRoute(AllTickets(status: 'all',)));
                        },
                        child: Text('View All', style: TextStyle(
                            color: _themeProvider.primaryColorLight),))
                  ],),
              )), SizedBox(
                height: height * .41,
                child: ListView.builder(itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          createRoute(TicketDetail(ticket: tickets[i],)));
                    },
                    child: TicketTile(
                        width,
                        height,
                        tickets[i].title,
                        tickets[i].status,
                        tickets[i].date,
                        true,
                        _themeProvider),
                  );
                }, itemCount: tickets.length,),
              )
            ],),
            )
          ],
        ),
      ),
    );
  }

  Container _indicatorDotsWidget(
      {required color , required double width,}) {
    return Container(
      height: 7,
      width: width,
      decoration: new BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}