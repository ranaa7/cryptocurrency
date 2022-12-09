
import 'package:cryptocurrency/core/themes.dart';
import 'package:cryptocurrency/screens/login_screen.dart';
import 'package:cryptocurrency/screens/register_screen.dart';
import 'package:cryptocurrency/screens/splash_screen.dart';
import 'package:cryptocurrency/view_model/provider/bottom_navy_provider.dart';
import 'package:cryptocurrency/view_model/provider/control_provider.dart';
import 'package:cryptocurrency/view_model/provider/detailed_provider.dart';
import 'package:cryptocurrency/view_model/provider/firebaseauth_provider.dart';
import 'package:cryptocurrency/view_model/provider/home_provider.dart';
import 'package:cryptocurrency/view_model/provider/search_provider.dart';
import 'package:cryptocurrency/view_model/provider/splash_provider.dart';
import 'package:cryptocurrency/view_model/provider/theme_provider.dart';
import 'package:cryptocurrency/widget/bottom_screen.dart';
import 'package:cryptocurrency/widget/control_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async{
 //Homeprovider().getallcoins();
 //Searchprovider().getsearchlist("bitcoin");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>Homeprovider()),
      ChangeNotifierProvider(create: (context)=>Searchprovider()),
      ChangeNotifierProvider(create: (context)=>Detailedprovider()),
      ChangeNotifierProvider(create: (context)=>Themeprovider()),
      ChangeNotifierProvider(create: (context)=>AuthProvider()),
      ChangeNotifierProvider(create: (context)=>Controlprovider()),
      ChangeNotifierProvider(create: (context)=>BottomNavyProvider()),
      ChangeNotifierProvider(create: (context)=>Splashprovider()),
    ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<Themeprovider>(context,listen:false).getThemeModeFromSharedPref();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme:  Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode:Provider.of<Themeprovider>(context).themeMode ,
      home: Splashscreen(),

    );
  }
}


