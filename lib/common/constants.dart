import 'package:flutter/material.dart';

double small = 10;
double medium = 40;
double large = 70;
late double screenWidth;
late double screenHeight;

late ThemeData themeData;

SizedBox smallSpacing = SizedBox(
  height: small,
);
SizedBox mediumSpacing = SizedBox(height: medium);
SizedBox largeSpacing = SizedBox(height: large);

Color lightColor1 = Colors.grey[400]!;
Color lightColor2 = Colors.deepPurple[200]!;

List<BottomNavigationBarItem> bottomNavBarItems = [
  BottomNavigationBarItem(
      label: "Timer",
      icon: Icon(
        Icons.timer_outlined,
        color: lightColor1,
      ),
      activeIcon: Icon(
        Icons.timer_rounded,
        color: lightColor2,
      )),
  BottomNavigationBarItem(
      label: "Day",
      icon: Icon(
        Icons.view_day_outlined,
        color: lightColor1,
      ),
      activeIcon: Icon(
        Icons.view_day,
        color: lightColor2,
      )),
  BottomNavigationBarItem(
      label: "friends",
      icon: Icon(
        Icons.people_outline,
        color: lightColor1,
      ),
      activeIcon: Icon(
        Icons.people_rounded,
        color: lightColor2,
      )),
];
