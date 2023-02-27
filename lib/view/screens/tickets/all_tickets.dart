import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/admin_provider.dart';
import 'package:ticketing_system/model/ticket_model.dart';
import 'package:ticketing_system/view/screens/dashboard.dart';
import 'package:ticketing_system/view/screens/tickets/ticket_detail.dart';

import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/dashboard_ticket_tile.dart';
import '../../widgets/drawer.dart';

import '../notification.dart';
import '../profile_settings/profile_settings.dart';
import 'create_ticket.dart';

class AllTickets extends StatefulWidget {
  String status;
  String? dropdownvalue;

  AllTickets({required this.status, this.dropdownvalue = 'All Tickets'});

  @override
  State<AllTickets> createState() => _AllTicketsState();
}

class _AllTicketsState extends State<AllTickets> {
  // Color black_color= Color(0xff2c2b2b);
  TextEditingController searchvalue = TextEditingController();
  List<Ticket> selected_tickets = [];
  List<Ticket> tickets = [];
  List<Ticket> All_tickets = [
    Ticket(title: 'Ticket 1', status: 'Status', date: '14 Nov 07:06'),
    Ticket(title: 'Ticket 2', status: 'Status', date: '8 Nov 09:00'),
    Ticket(title: 'Ticket 3', status: 'Status', date: '14 Nov 07:06'),
    Ticket(title: 'Ticket 4', status: 'Status', date: '7 Nov 07:15'),
    Ticket(title: 'Ticket 5', status: 'Status', date: '14 Nov 07:06'),
    Ticket(title: 'Ticket 6', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'Ticket 7', status: 'Status', date: '14 Nov 07:22'),
    Ticket(title: 'Ticket 8', status: 'Status', date: '20 Nov 07:04'),
    Ticket(title: 'Ticket 9', status: 'Status', date: '2 Nov 07:06'),
    Ticket(title: 'Ticket 10', status: 'Status', date: '14 Nov 04:11'),
    Ticket(title: 'Ticket 11', status: 'Status', date: '14 Nov 07:06'),
    Ticket(title: 'Ticket 12', status: 'Status', date: '20 Nov 01:46'),
  ];
  List<Ticket> Active_Tickets = [
    Ticket(title: 'Actice Ticket 76', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'Active Ticket 97', status: 'Status', date: '14 Nov 07:22'),
  ];

  List<Ticket> Closed_Tickets = [
    Ticket(title: 'Closed Ticket 20', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'Closed Ticket 11', status: 'Status', date: '14 Nov 07:22'),
  ];
  List<Ticket> onhold_Tickets = [
    Ticket(title: 'On hold Ticket 20', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'On hold Ticket 11', status: 'Status', date: '14 Nov 07:22'),
  ]; //admin
  List<Ticket> my_Tickets = [
    Ticket(title: 'my Ticket 0248', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'my Ticket 1', status: 'Status', date: '14 Nov 07:22'),
  ];
  List<Ticket> assign_Tickets = [
    Ticket(title: 'assign Ticket 00', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'assign Ticket 55', status: 'Status', date: '14 Nov 07:22'),
  ];
  List<Ticket> my_assign_Tickets = [
    Ticket(
        title: 'my_assign Ticket 75556', status: 'Status', date: '6 Nov 07:06'),
    Ticket(
        title: 'my_assign Ticket 0097', status: 'Status', date: '14 Nov 07:22'),
  ];
  List<Ticket> overdue_Tickets = [
    Ticket(title: 'overdue Ticket 1', status: 'Status', date: '6 Nov 07:06'),
    Ticket(title: 'overdue Ticket 48', status: 'Status', date: '14 Nov 07:22'),
  ];
 String  dropdownvalue='';

  var items = [
    'All Tickets',
    'Active Tickets',
    'Closed Tickets',
    'On-hold Tickets'

  ];
  var items_admin = [
    'All Tickets',
    'Active Tickets',
    'Closed Tickets',
    'On-hold Tickets',
    'My Tickets',
    'Assigned Tickets',
    'My assign Tickets',
    'Overdue Tickets',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.status == 'active') {
      tickets = Active_Tickets;
    } else if (widget.status == 'closed') {
      tickets = Closed_Tickets;
    } else if (widget.status == 'on-hold') {
      tickets = onhold_Tickets;
    }else if (widget.status == 'my_tickets') {
      tickets = my_Tickets;
    }else if (widget.status == 'assign') {
      tickets = assign_Tickets;
    }else if (widget.status == 'my_assign') {
      tickets = my_assign_Tickets;
    }else if (widget.status == 'overdue') {
      tickets = overdue_Tickets;
    }
    else if (widget.status == 'all') {
      tickets = All_tickets;
    }
    // tickets=All_tickets;
    if (tickets.length >= 6) {
      for (int i = 0; i < 6; i++) {
        selected_tickets.add(tickets[i]);
      }
    } else {
      for (int i = 0; i < tickets.length; i++) {
        selected_tickets.add(tickets[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var selectedPageNumber = 3;
    ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Dashboard()),
          ModalRoute.withName('/'),
        );
        return true;
      },
      child: GestureDetector(
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
                    Navigator.of(context)
                        .push(createRoute(NotificationScreen()));
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * .01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: _themeProvider.primaryColorLight,
                          )),
                      Container(
                        color: _themeProvider.white_color,
                        width: width * .7,
                        height: height * .052,
                        child: TextFormField(
                          controller: searchvalue,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Search..',
                            hintStyle: TextStyle(color: Color(0xff8e8c8c)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: _themeProvider.light_border_color),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: _themeProvider.light_border_color,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ), //box**********************************************************
                Container(
                  width: width * .9,
                  height: height * .75,
                  decoration: BoxDecoration(
                      //   color: Color(0xffe4eef3),
                      border: Border(
                          top: BorderSide(
                            width: 3,
                            color:
                                _themeProvider.white_color, // Color(0xff2c2b2b)
                          ),
                          bottom: BorderSide(
                              width: 3,
                              color: _themeProvider.light_border_color),
                          left: BorderSide(
                              width: 3,
                              color: _themeProvider.light_border_color),
                          right: BorderSide(
                              width: 3,
                              color: _themeProvider.light_border_color))
                      //  borderRadius:BorderRadius.circular(8),
                      ),
                  child: Column(
                    children: [
                      Container(
                          width: width * .9,
                          height: height * .07,
                          decoration: BoxDecoration(
                            color: _themeProvider.dividerColor,
                            // border: Border.all(color:Color(0xff8e8c8c),),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    adminProvider.admin
                                        ? DropdownButton(
                                            underline: SizedBox(),
                                            // Initial Value
                                            value: widget.dropdownvalue,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: _themeProvider
                                                  .primaryColorLight,
                                            ),
                                            selectedItemBuilder: (context) {
                                              return items_admin
                                                  .map<Widget>((String item) {
                                                return Container(
                                                  child: Center(
                                                    child: Text(item,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          color:
                                                              Color(0xff000000),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                  ),
                                                );
                                              }).toList();
                                            },
                                            // Array list of items
                                            items:
                                                items_admin.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              selected_tickets = [];
                                              if (newValue ==
                                                  'Active Tickets') {
                                                this.tickets = Active_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              } else if (newValue ==
                                                  'On-hold Tickets') {
                                                this.tickets = onhold_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              } else if (newValue ==
                                                  'Closed Tickets') {
                                                this.tickets = Closed_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                           // 'My Tickets'  'Assigned Tickets'   'My assign Tickets'    'Overdue Tickets',
                                              else if (newValue ==
                                                  'My Tickets') {
                                                this.tickets = my_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                                              else if (newValue ==
                                                  'Assigned Tickets') {
                                                this.tickets = assign_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                                              else if (newValue ==
                                                  'My assign Tickets') {
                                                this.tickets = my_assign_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                                              else if (newValue ==
                                                  'Overdue Tickets') {
                                                this.tickets = overdue_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                                              else {
                                                tickets = All_tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                  i < tickets.length;
                                                  i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                                              setState(() {
                                                widget.dropdownvalue = newValue;
                                              });
                                            })
                                        : DropdownButton(
                                            underline: SizedBox(),
                                            // Initial Value
                                            value: widget.dropdownvalue,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: _themeProvider
                                                  .primaryColorLight,
                                            ),
                                            selectedItemBuilder: (context) {
                                              return items
                                                  .map<Widget>((String item) {
                                                return Container(
                                                  child: Center(
                                                    child: Text(item,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          color:
                                                              Color(0xff000000),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                  ),
                                                );
                                              }).toList();
                                            },
                                            // Array list of items
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              selected_tickets = [];
                                              if (newValue ==
                                                  'Active Tickets') {
                                                this.tickets = Active_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                      i < tickets.length;
                                                      i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              } else if (newValue ==
                                                  'On-hold Tickets') {
                                                this.tickets = onhold_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                      i < tickets.length;
                                                      i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              } else if (newValue ==
                                                  'Closed Tickets') {
                                                this.tickets = Closed_Tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                      i < tickets.length;
                                                      i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              } else {
                                                tickets = All_tickets;
                                                if (tickets.length >= 6) {
                                                  for (int i = 0; i < 6; i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                } else {
                                                  for (int i = 0;
                                                      i < tickets.length;
                                                      i++) {
                                                    selected_tickets
                                                        .add(tickets[i]);
                                                  }
                                                }
                                              }
                                              setState(() {
                                                widget.dropdownvalue = newValue;
                                              });
                                            }),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(createRoute(CreateTicket()));
                                    },
                                    child: Container(
                                        width: width * .27,
                                        height: height * .1,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: _themeProvider
                                                    .primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Center(
                                            child: const Text('Add Ticket +'))))
                              ],
                            ),
                          )),
                      SizedBox(
                        height: height * .56,
                        child: ListView.builder(
                            itemCount: selected_tickets.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(createRoute(TicketDetail(
                                      ticket: selected_tickets[i],
                                    )));
                                  },
                                  child: TicketTile(
                                      width,
                                      height,
                                      selected_tickets[i].title,
                                      selected_tickets[i].status,
                                      selected_tickets[i].date,
                                      false,
                                      _themeProvider));
                            }),
                      ),
                      NumberPagination(
                        onPageChanged: (int pageNumber) {
                          var ii = 0;
                          print(pageNumber);
                          selected_tickets = [];
                          int skip = (pageNumber - 1) * 6;

                          for (int i = skip;
                              ii < 6 && i < tickets.length;
                              i++) {
                            print(tickets[i].title);
                            selected_tickets.add(tickets[i]);
                            ii++;
                          }
                          setState(() {
                            selectedPageNumber = pageNumber;
                            selected_tickets;
                          });
                        },
                        threshold: 4,
                        fontSize: width * .05,
                        pageTotal: (tickets.length / 6).ceil(),
                        pageInit: 1,
                        // picked number when init page
                        colorPrimary: _themeProvider.primaryColorLight,
                        colorSub: _themeProvider.primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
