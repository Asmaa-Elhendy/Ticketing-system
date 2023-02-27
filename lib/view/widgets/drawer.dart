import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/controller/provider/admin_provider.dart';
import 'package:ticketing_system/view/screens/canned%20response/all_canned_res.dart';
import 'package:ticketing_system/view/screens/dashboard.dart';
import 'package:ticketing_system/view/screens/settings.dart';
import 'package:ticketing_system/view/screens/tickets/all_tickets.dart';
import 'package:ticketing_system/view/screens/tickets/create_ticket.dart';
import '../../controller/page_route.dart';
import '../../controller/provider/theme_provider.dart';
import '../screens/article/all_articles.dart';
import '../screens/customer/all_customers.dart';
import '../screens/employee/all_employee.dart';
import '../screens/groups/all_groups.dart';
import '../screens/profile_settings/profile_settings.dart';
import '../screens/projects/all_projects.dart';
class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Color black_color= Color(0xff2c2b2b);
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context,listen: false);
    AdminProvider _adminprovider =Provider.of<AdminProvider>(context);
    return Drawer(
      backgroundColor: _themeProvider.backgroundColor,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: height*.05),
        children: [

          ListTile(
            leading: Icon(Icons.dashboard,color: _themeProvider.primaryColorLight,),
            title:  Text('Dashboard',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => Dashboard(),
                ),
                    (route) => false,//if you want to disable back feature set to false
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_accounts,color: _themeProvider.primaryColorLight,),
            title:  Text('Profile Settings',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(ProfileSettings()));
            },
          ),
          ListTile(
            leading: Icon(Icons.post_add_outlined,color: _themeProvider.primaryColorLight,),
            title:  Text('Add Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(CreateTicket()));
            },),
      _adminprovider.admin?
      ExpansionTile(
        leading:SvgPicture.asset(
          'assets/images/confirmation_number4.svg',
          color: _themeProvider.primaryColorLight,
        ),trailing: Icon(Icons.expand_more,color: _themeProvider.primaryColorLight,),
        title:  Text('Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
        children: [
          ListTile(
            leading:SizedBox(width: width*.02,),
            title:  Text('All Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'all',dropdownvalue: 'All Tickets',)));
            },),
          ListTile(
            leading:SizedBox(width: width*.02,),
            title:  Text('Active Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'active',dropdownvalue: 'Active Tickets',)));
            },),
          ListTile(
            leading:  SizedBox(width: width*.02,),
            title:  Text('On-hold Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'on-hold',dropdownvalue: 'On-hold Tickets',)));
            },),
          ListTile(
            leading:  SizedBox(width: width*.02,),
            title:  Text('My Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'my_tickets',dropdownvalue: 'My Tickets',)));
            },),
          ListTile(
            leading:  SizedBox(width: width*.02,),
            title:  Text('Assign Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'assign',dropdownvalue: 'Assigned Tickets',)));
            },),
          ListTile(
            leading:  SizedBox(width: width*.02,),
            title:  Text('My Assign Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'my_assign',dropdownvalue: 'My assign Tickets',)));
            },),
          ListTile(
            leading:  SizedBox(width: width*.02,),
            title:  Text('Overdue Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status: 'overdue',dropdownvalue: 'Overdue Tickets',)));
            },),
          ListTile(
            leading: SizedBox(width: width*.02,),
            title:  Text('Closed Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(AllTickets(status:'closed' ,dropdownvalue: 'Closed Tickets')));
            },),
        ],)

          :Column(children: [
           ListTile(
             leading: Icon(Icons.local_activity_outlined,color: _themeProvider.primaryColorLight,),
             title:  Text('Active Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllTickets(status: 'active',dropdownvalue: 'Active Tickets',)));
             },),
           ListTile(
             leading:  SvgPicture.asset(
               'assets/images/confirmation_number.svg',color: _themeProvider.primaryColorLight,

             ),
             title:  Text('On-hold Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllTickets(status: 'on-hold',dropdownvalue: 'On-hold Tickets',)));
             },),
           ListTile(
             leading:  SvgPicture.asset(
               'assets/images/confirmation_number2.svg',color: _themeProvider.primaryColorLight,

             ),
             title:  Text('Closed Tickets',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllTickets(status:'closed' ,dropdownvalue: 'Closed Tickets')));
             },),
         ],),
       _adminprovider.admin?   Column(
         children: [
           ListTile(
                leading: Icon(Icons.badge_outlined,color: _themeProvider.primaryColorLight,),
                title:  Text('Employee',style: TextStyle(color: _themeProvider.primaryColorLight),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push( createRoute(AllEmployee()));
                },),
           ListTile(
             leading: Icon(Icons.support_agent_outlined,color: _themeProvider.primaryColorLight,),
             title:  Text('Customer',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllCustomers()));
             },),
           ListTile(
             leading: Icon(Icons.view_list_outlined,color: _themeProvider.primaryColorLight,),
             title:  Text('Project',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllProjects()));
             },),ListTile(
             leading: Icon(Icons.workspaces_outline,color: _themeProvider.primaryColorLight,),
             title:  Text('Groups',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllGroups()));
             },),
           ListTile(
             leading: Icon(Icons.sticky_note_2_outlined,color: _themeProvider.primaryColorLight,),
             title:  Text('Canned response',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllCannedResponse()));
             },),
           ListTile(
             leading: Icon(Icons.article_outlined,color: _themeProvider.primaryColorLight,),
             title:  Text('Article ',style: TextStyle(color: _themeProvider.primaryColorLight),),
             onTap: () {
               Navigator.pop(context);
               Navigator.of(context).push( createRoute(AllArticles()));
             },),
         ],
       ):SizedBox(),
          ListTile(
            leading: Icon(Icons.settings,color: _themeProvider.primaryColorLight,),
            title:  Text('Settings',style: TextStyle(color: _themeProvider.primaryColorLight),),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push( createRoute(Settings()));
            },),
        ],
      ),
    );
  }
}
