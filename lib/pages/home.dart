import 'dart:math';

import 'package:daily_plan_tracker/common/components.dart';
import 'package:daily_plan_tracker/pages/daysPage.dart';
import 'package:daily_plan_tracker/pages/friendsPage.dart';
import 'package:daily_plan_tracker/pages/profilePage.dart';
import 'package:daily_plan_tracker/pages/timerPage.dart';
import 'package:flutter/material.dart';
import '../common/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: xGlassBgEffect(
          child: TabBar(
            controller: _tabController,
            labelColor: lightColor2,
            unselectedLabelColor: lightColor1.withOpacity(0.5),
            indicatorWeight: small/3,
            splashBorderRadius: BorderRadius.circular(small),
            tabs: const [
              Tab(
                icon: Icon(Icons.timer_outlined),
              ),
              Tab(
                icon: Icon(Icons.view_day_outlined),
              ),
              Tab(
                icon: Icon(Icons.people_outline),
              ),
              Tab(
                icon: Icon(Icons.person_outline_rounded),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: statusBarHeight), // to attain safe area
          child: TabBarView(
            controller: _tabController,
            children:  [TimerPage(),DaysPage(),FriendsPage(), ProfilePage()],
          ),
        ),
      ),
    );
  }
}
