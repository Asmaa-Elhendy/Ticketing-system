import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/view/screens/dashboard.dart';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../../model/project_model.dart';
import '../../widgets/drawer.dart';
import '../../widgets/project_tile.dart';
import '../notification.dart';
import '../profile_settings/profile_settings.dart';
import 'assign_project.dart';

class AllProjects extends StatefulWidget {

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {

  // Color black_color= Color(0xff2c2b2b);
  TextEditingController searchvalue=TextEditingController();

  List<Project> selected_project=[];
  List<Project>   all_projects=[
    Project(name: 'Project 1'),
    Project(name: 'Project 2', ),
    Project(name: 'Project 3'),
    Project(name: 'Project 4'),
    Project(name: 'Project 6'),
    Project(name: 'Project 7', ),
    Project(name: 'Project 8'),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (all_projects.length >= 6) {
      for (int i = 0; i < 6; i++) {
        selected_project.add(all_projects[i]);
      }
    } else {
      for (int i = 0; i < all_projects.length; i++) {
        selected_project.add(all_projects[i]);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    var selectedPageNumber = 3;
    ThemeProvider _themeProvider =Provider.of<ThemeProvider>(context);

    return WillPopScope(
      onWillPop: ()async{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Dashboard()),ModalRoute.withName('/'),);
        return true;
      },
      child: GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus;
          currentFocus=FocusScope.of(context);
          if(!currentFocus.hasPrimaryFocus){
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar:  AppBar(backgroundColor:_themeProvider.primaryColor,foregroundColor: _themeProvider.primaryColorLight,
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
          drawer: Container(
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
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: height*.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: _themeProvider.primaryColorLight,)),
                    Container(color: _themeProvider.white_color,
                      width: width*.7,
                      height: height*.052,
                      child: TextFormField(
                        controller:searchvalue,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: IconButton(icon: Icon(Icons.search),onPressed: (){},),
                          ),
                          contentPadding: EdgeInsets.all(5),
                          hintText: 'Search..',
                          hintStyle: TextStyle(color: Color(0xff8e8c8c)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: _themeProvider.light_border_color),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:_themeProvider.light_border_color,
                              )),
                        ),
                      ),
                    )
                  ],),
              ),//box**********************************************************
              Container(
                width: width*.9,height: height*.75,
                decoration: BoxDecoration(
                  //   color: Color(0xffe4eef3),
                    border: Border(
                        top: BorderSide( width: 3,color:_themeProvider.white_color, // Color(0xff2c2b2b)
                        )     , bottom: BorderSide( width: 3,color:_themeProvider.light_border_color ),
                        left: BorderSide( width: 3,color:_themeProvider.light_border_color ),
                        right: BorderSide( width: 3,color:_themeProvider.light_border_color )
                    )
                  //  borderRadius:BorderRadius.circular(8),
                ),child: Column(children: [
                Container(
                    width: width*.9,
                    height: height*.07,
                    decoration: BoxDecoration(
                      color: _themeProvider.dividerColor,
                      // border: Border.all(color:Color(0xff8e8c8c),),
                      borderRadius:BorderRadius.circular(6),
                    ),child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Row(
                        children: [
                          Text('All Projects',style: TextStyle(color: _themeProvider.primaryColorLight,fontWeight: FontWeight.w600,fontSize: 18),)


                        ],
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push( createRoute(AssignProject(projects:all_projects,)));
                          },
                          child:Container(
                              width: width*.33,
                              height: height*.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: _themeProvider.primaryColor),borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: const Text('Assign Project +'))))
                    ],),
                )),
                SizedBox(height: height*.56,
                  child: ListView.builder(
                      itemCount: selected_project.length,
                      itemBuilder:(context,i){

                        return  InkWell(
                            onTap: (){
                        //      Navigator.of(context).push( createRoute(CustomerDetails(customer: selected_project[i],)));
                            },
                            child: ProjectTile(width,height,selected_project[i],_themeProvider)
                        );
                      }),),



                NumberPagination(
                  onPageChanged: (int pageNumber) {
                    var ii=0;
                    print(pageNumber);
                    selected_project=[];
                    int skip= (pageNumber-1)*6;

                    for(int i=skip;ii<6&&i<all_projects.length;i++){

                      selected_project.add(all_projects[i]);
                      ii++;

                    }
                    setState(() {

                      selectedPageNumber = pageNumber;
                      selected_project;
                    });

                  },threshold: 4,fontSize: width*.05,
                  pageTotal:(all_projects.length/6).ceil(),
                  pageInit: 1, // picked number when init page
                  colorPrimary: _themeProvider.primaryColorLight,
                  colorSub:_themeProvider.primaryColor,
                ),
              ],),
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}
