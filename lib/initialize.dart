import 'package:daily_plan_tracker/pages/home.dart';
import 'package:flutter/material.dart';

import 'common/constants.dart';

class Initialize extends StatefulWidget {
  const Initialize({Key? key}) : super(key: key);

  @override
  State<Initialize> createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVariables(context),
      builder: (context, snapshot) {
        return const Home();
      },
    );
  }
}

Future<void> initializeVariables(BuildContext context) async {
  // doubles
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;
  statusBarHeight = MediaQuery.of(context).viewPadding.top;
  bottomNavHeight  = MediaQuery.of(context).padding.bottom;
  // theme data
  themeData = Theme.of(context);
  return;
}
