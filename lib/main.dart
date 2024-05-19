import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/auth/login_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/welcome_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/places_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: Platform.isAndroid? 
    FirebaseOptions(
      apiKey:"AIzaSyCxvFNtMl7DKIv5gmk2ESDF-P3pddoj6BY",
      appId: "1:242426567241:android:0552d1415cb6f49400fd98",
     messagingSenderId:"242426567241", 
     projectId: "mobile-travel-app-83152",
     storageBucket: "mobile-travel-app-83152.appspot.com",) 
     : null);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
      routes: {
       PlacesWidget.routeName: (ctx) => PlacesWidget(),
      },
    );
  }
}

