import 'package:daily_plan_tracker/common/components.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenPadding.top, horizontal: small*2),
      width: screenWidth,
      height: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Expanded(
            flex: 1,
              child: Center()),
          // username
          Row(
            children: [
              Text(
                "User Name",
                style: themeData.textTheme.displayLarge,
              ),
              xEditButton(onPressed: () {}),
            ],
          ),
          // user id
          Opacity(
            opacity: 0.7,
            child: Text(
              "@user1",
              style: themeData.textTheme.headlineSmall,
            ),
          ),
          const Expanded(
              flex: 1,
              child: Center()),
          // reset password
          Center(
            child: Container(
              padding: EdgeInsets.only(top: small*0),
              width: screenWidth*0.75,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(vertical: small,horizontal: small),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(small),
                          side: BorderSide(color: lightColor2, width: 1.5))),
                  child: Text(
                    "Reset Password",
                    style: themeData.textTheme.titleMedium!.copyWith(color: lightColor2),
                  )),
            ),
          ),
          // switch user
          Center(
            child: Container(
              padding: EdgeInsets.only(top: small*2),
              width: screenWidth*0.75,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(vertical: small,horizontal: small),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(small),
                          side: BorderSide(color: lightColor2, width: 1.5))),
                  child: Text(
                    "Switch User",
                    style: themeData.textTheme.titleMedium!.copyWith(color: lightColor2),
                  )),
            ),
          ),
          // Login to another account
          Center(
            child: Container(
              padding: EdgeInsets.only(top: small*2),
              width: screenWidth*0.75,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                     minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(vertical: small,horizontal: small),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(small),
                          side: BorderSide(color: Colors.red[900]!, width: 1.5))),
                  child: Text(
                    "Delete Account",
                    style: themeData.textTheme.titleMedium!.copyWith(color: Colors.red[900]!),
                  )),
            ),
          ),
          const Expanded(
              flex: 2,
              child: Center()),
        ],
      ),
    );
  }
}
