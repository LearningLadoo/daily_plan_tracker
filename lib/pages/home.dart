import 'dart:math';

import 'package:daily_plan_tracker/pages/daysPage.dart';
import 'package:daily_plan_tracker/pages/friendsPage.dart';
import 'package:daily_plan_tracker/pages/timerPage.dart';
import 'package:flutter/material.dart';
import '../common/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: bottomNavBarItems,
          ),
          body: const TabBarView(children: [
            TimerPage(),
            DaysPage(),
            FriendsPage()
          ],),
        ),
      ),
    );
  }
}
