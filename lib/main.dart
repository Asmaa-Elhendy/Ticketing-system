import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/simple_builder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticketing_system/controller/provider/projects_provider.dart';
import 'package:ticketing_system/controller/provider/theme_provider.dart';
import 'package:ticketing_system/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'controller/provider/admin_provider.dart';
import 'controller/provider/subcategories_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  GetStorage storage = GetStorage();
  String? themename = await storage.read('name_theme');
  print('in main $themename');
  String? path = await storage.read('path');
  String? splash_path = await storage.read('frame_splash_path');
  print('splash $splash_path');
  runApp(MyApp(themename: themename, path: path,splash_path: splash_path,));
}

class MyApp extends StatelessWidget {
  String? themename;
  String? path;
  String? splash_path;
  MyApp({required this.themename, required this.path,required this.splash_path});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(),),
        ChangeNotifierProvider(create: (_) => SubCategoriesProvider(),),
        ChangeNotifierProvider(create: (_) => ProjectsProvider(),),
        ChangeNotifierProvider(create: (_)=>AdminProvider())

      ],
      child: SimpleBuilder(
        builder: (context) {


          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ticketing System',
              //  theme: bluee,
              home: MysPLASH(themename: themename,path: path,splash_path:splash_path));
        },
      ),

    );
  }
}
class MysPLASH extends StatefulWidget {
  String? themename;
  String? path;
  String? splash_path;
  MysPLASH({required this.themename, required this.path,required this.splash_path});

  @override
  State<MysPLASH> createState() => _MysPLASHState();
}

class _MysPLASHState extends State<MysPLASH> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context,listen: false);
      if (widget.themename == 'dark_blue' ){
        _themeProvider.setDarkBlue();
      }else  if (widget.themename == 'dark_pink' ){
        _themeProvider.setDarkBink();
      }else  if (widget.themename == 'dark_purple' ){
        _themeProvider.setDarkBurple();
      }else  if (widget.themename == 'light_blue' ){
        _themeProvider.setLightBlue();
      }else  if (widget.themename == 'light_pink' ){
        _themeProvider.setLightBink();
      }else  if (widget.themename == 'light_blue_gray' ){
        _themeProvider.setLightBlueGrey();
      }else{
        _themeProvider.setLightBlue();
      }




    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ticketing System',
        //  theme: bluee,
        home: SplashScreen(theme_name: widget.themename, splash_path:widget.splash_path,path:widget.path));
  }
}
