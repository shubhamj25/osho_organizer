import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oshoorganiser/newLoginscreen2.dart';
import 'package:oshoorganiser/splashscreen.dart';
import 'aeoui.dart';
import 'constant/constant.dart';


Future<void> main() async{
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseApp.configure(
      name:'osho-aashrams',
      options: Platform.isAndroid
          ?const FirebaseOptions(
          googleAppID: '1:140743109004:android:557dfe86d23494acc3cea9',
          apiKey: "AIzaSyCYyJga1N4I3LvFABlysP60jkN3ckcReZc",
          databaseURL: "https://osho-b6c37.firebaseio.com/"
      ):null);
  runApp(MaterialApp(
    title: 'AEO UI',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue,fontFamily: 'Raleway'),
    routes: <String, WidgetBuilder>{
      Constants.SPLASH_SCREEN: (BuildContext context) =>
          AnimatedSplashScreen(),
      Constants.LOGIN_PAGE: (BuildContext context) => NewLoginScreenTwo(),
      Constants.AEO_UI: (BuildContext context) => AeoUI(),
    },
    initialRoute: Constants.SPLASH_SCREEN,
  ));
}

