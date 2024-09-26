// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_application_1/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//This keep track of the current page to display
  int _selectedIndex = 0;

//This Method update New selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //Homepage
    HomePage(),
    //profilepage
    ProfilePage(),
    //settingspage
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/HomePage': (context) => HomePage(),
        '/SettingsPage': (context) => SettingPage(),
        '/ProfilePage': (context) => ProfilePage(),
      },
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: Text("Rohi App"),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          // leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 48,
                ),
              ),

              //home page list title
              ListTile(
                leading: Icon(Icons.home),
                title: Text("H O M E"),
                onTap: () {
                  Navigator.pushNamed(context, '/HomePage');
                },
              ),

              //setting page list title
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("S E T T I N G S"),
                onTap: () {
                  Navigator.pushNamed(context, '/SettingsPage');
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("P R O F I L E"),
                onTap: () {
                  Navigator.pushNamed(context, '/ProfilePage');
                },
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
