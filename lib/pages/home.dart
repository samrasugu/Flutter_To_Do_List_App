// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/pages/login.dart';
import 'package:flutter_todo_list_app/pages/profile_page.dart';
import 'package:flutter_todo_list_app/pages/settings_page.dart';
import 'package:flutter_todo_list_app/pages/tasks.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void navigateBottom(int index) {
    setState(() {
      index = _selectedIndex;
    });
  }

  final List<Widget> _pages = [
    Home(),
    SettingsPage(),
    Tasks(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade900,
          title: Text('TODO LIST APP'),
          actions: [
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LogInPage(showRegisterPage: () {})));
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ),
            )
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: navigateBottom,
          backgroundColor: Colors.lightBlue.shade900,
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
