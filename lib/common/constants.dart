import 'package:flutter/material.dart';

double small = 10;
double medium = 40;
double large = 70;
late double screenWidth;
late double screenHeight;
late double statusBarHeight;
late double bottomNavHeight;

late ThemeData themeData;
ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    textTheme: ThemeData.dark(useMaterial3: true)
        .textTheme
        .copyWith(
          displaySmall: const TextStyle(fontWeight: FontWeight.w600),
          displayLarge: const TextStyle(fontWeight: FontWeight.w600),
        )
        .apply(displayColor: lightColor1, bodyColor: lightColor1));
SizedBox smallSpacing = SizedBox(
  height: small,
);
SizedBox mediumSpacing = SizedBox(height: medium);
SizedBox largeSpacing = SizedBox(height: large);

Color lightColor1 = Colors.grey[300]!.withOpacity(1);
Color lightColor2 = Colors.deepPurple[200]!;

EdgeInsets screenPadding =
    EdgeInsets.fromLTRB(small * 1.5, small, small * 1.5, 0);