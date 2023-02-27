import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/model/canned_res_model.dart';
import 'package:ticketing_system/view/screens/dashboard.dart';
import 'package:ticketing_system/view/widgets/canned_tile.dart';
import '../../../controller/page_route.dart';
import '../../../controller/provider/theme_provider.dart';
import '../../widgets/drawer.dart';
import '../notification.dart';
import '../profile_settings/profile_settings.dart';
import 'add_canned.dart';
import 'edit_canned.dart';

class AllCannedResponse extends StatefulWidget {

  @override
  State<AllCannedResponse> createState() => _AllCannedResponseState();
}

class _AllCannedResponseState extends State<AllCannedResponse> {


  TextEditingController searchvalue=TextEditingController();

  List<CannedResponse> selected_canned=[];
  List<CannedResponse>   all_canned=[
    CannedResponse(title: 'Ticket received',message: 'Lorem Ipsum is simply dummy text of the printing and type' ),
    CannedResponse(title: 'We’ll connect you',message: 'Lorem Ipsum is simply dummy text of the printing and type'),
    CannedResponse(title: 'Ticket received',message: 'Lorem Ipsum is simply dummy text of the printing and type' ),
    CannedResponse(title: 'We’ll connect you',message: 'Lorem Ipsum is simply dummy text of the printing and type'),
    CannedResponse(title: 'Ticket received',message: 'Lorem Ipsum is simply dummy text of the printing and type' ),
    CannedResponse(title: 'We’ll connect you',message: 'Lorem Ipsum is simply dummy text of the printing and type'),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (all_canned.length >= 5) {
      for (int i = 0; i < 5; i++) {
        selected_canned.add(all_canned[i]);
      }
    } else {
      for (int i = 0; i < all_canned.length; i++) {
        selected_canned.add(all_canned[i]);
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
                          Text('All Canned Response',style: TextStyle(color: _themeProvider.primaryColorLight,fontWeight: FontWeight.w600,fontSize: 18),)


                        ],
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push( createRoute(AddNewCanned()));
                          },
                          child:Container(
                              width: width*.33,
                              height: height*.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: _themeProvider.primaryColor),borderRadius: BorderRadius.circular(6)
                              ),
                              child: Center(child: const Text('Add Canned +'))))
                    ],),
                )),
                SizedBox(height: height*.56,
                  child: ListView.builder(
                      itemCount: selected_canned.length,
                      itemBuilder:(context,i){

                        return  InkWell(
                            onTap: (){
                                    Navigator.of(context).push( createRoute(EditCaneed(cannedResponse: selected_canned[i])));
                            },
                            child: CannedTile(width,height,selected_canned[i],_themeProvider)
                        );
                      }),),



                NumberPagination(
                  onPageChanged: (int pageNumber) {
                    var ii=0;
                    print(pageNumber);
                    selected_canned=[];
                    int skip= (pageNumber-1)*5;

                    for(int i=skip;ii<5&&i<all_canned.length;i++){

                      selected_canned.add(all_canned[i]);
                      ii++;

                    }
                    setState(() {

                      selectedPageNumber = pageNumber;
                      selected_canned;
                    });

                  },threshold: 4,fontSize: width*.05,
                  pageTotal:(all_canned.length/5).ceil(),
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
