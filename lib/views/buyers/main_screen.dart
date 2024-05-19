import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/account_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/chat_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/features_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/home_screen.dart';
import 'package:master_travel/views/buyers/nav_screens/map_screen.dart';

import 'package:master_travel/views/buyers/nav_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex =0;

  List<Widget> _pages = [
    HomeScreen(),
    
    SearchScreen(),

    CategoryScreen(),

    ChatScreen(),

    MapScreen(),
    
    AccountScreen(),

    

  
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap:(value){
          setState(() {
            _pageIndex=value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow,
        items: const [
        BottomNavigationBarItem(icon:Icon(CupertinoIcons.home),label: 'HOME',),
        
        BottomNavigationBarItem(icon:Icon(CupertinoIcons.search_circle),label: 'SEARCH',),

         BottomNavigationBarItem(icon:Icon(CupertinoIcons.light_min),label: 'FEATURES',),

         BottomNavigationBarItem(icon:Icon(CupertinoIcons.mail),label: 'CHAT',),

          BottomNavigationBarItem(icon:Icon(CupertinoIcons.location),label: 'MAP',),

                
        BottomNavigationBarItem(icon:Icon(CupertinoIcons.person),label: 'PROFILE',),

        
       
      ],
      ),
      body: _pages[_pageIndex],
    );
  }
}