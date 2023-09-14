import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../common/complex/ContainerWithPerBorder.dart';
import '../common/components.dart';
import '../common/constants.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  String? _selectedUserName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: large, left: screenPadding.left,right: screenPadding.right),
            child: Column(
              children: (friendsList??[]).map((details) => friendCard(details)).followedBy([friendInvitationCard()]).toList(),
            ),
          ),
          xGlassBgEffect(
            width: screenWidth,
            height: large,
            child: Center(
              child: Text(
                "Friends",
                style: themeData.textTheme.displaySmall,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget friendCard(Map<String, String> details) {
    int per = double.parse(details["per"] ?? "69").round();
    String username = details["username"]!;
    return Padding(
      padding: EdgeInsets.only(bottom: small),
      child: TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: per),
          curve: Curves.easeOutSine,
          duration: const Duration(seconds: 2),
          builder: (context, i, child) {
            return ContainerWithPerBorder(
                height: _selectedUserName == username ? large * 1.5 + small * 1.3 : large * 1.5,
                width: screenWidth,
                radius: small * 1.5,
                emptyProgressColor: lightColor1.withOpacity(0.1),
                progressColor: lightColor2,
                progressValue: i / 100,
                progressWidth: small / 5,
                child: Card(
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      splashColor: lightColor2.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(small),
                      onTap: () {
                        _selectedUserName = _selectedUserName != username ? username : null;
                        setState(() {});
                      },
                      child: SizedBox(
                        width: screenWidth,
                        child: Padding(
                          padding: EdgeInsets.all(small),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      details["name"] ?? "-",
                                      style: themeData.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Opacity(opacity: 0.7, child: Text(details["username"] ?? "-")),
                                    SizedBox(
                                      height: small - small / 5,
                                    ),
                                    if (_selectedUserName == username)
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: small * 3,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor: lightColor2.withOpacity(0.1),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(small),
                                                  )),
                                              child: Text(
                                                "View",
                                                style: themeData.textTheme.titleSmall!.copyWith(color: lightColor1.withOpacity(0.75)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: small,
                                          ),
                                          SizedBox(
                                            height: small * 3,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor: Colors.red[900]!.withOpacity(0.17),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(small),
                                                  )),
                                              child: Text(
                                                "Remove",
                                                style: themeData.textTheme.titleSmall!.copyWith(color: lightColor1.withOpacity(0.75)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: small),
                                child: Text("$i%", style: themeData.textTheme.displaySmall!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )));
          }),
    );
  }

  Widget friendInvitationCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: small*5),
      child: ContainerWithPerBorder(
          height: large * 1.5,
          width: screenWidth,
          radius: small * 1.5,
          emptyProgressColor: lightColor1.withOpacity(0),
          progressColor: lightColor2,
          progressValue: 0,
          progressWidth: small / 5,
          child: Card(
              margin: EdgeInsets.zero,
              color: lightColor2.withOpacity(0.15),
              child: InkWell(
                splashColor: lightColor2.withOpacity(0.7),
                borderRadius: BorderRadius.circular(small),
                onTap: () {},
                child: SizedBox(
                  width: screenWidth,
                  child: Padding(
                      padding: EdgeInsets.all(small),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Invite",
                                  style: themeData.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const Opacity(
                                    opacity: 0.7,
                                    child: Text(
                                      "Send to the people you wish to share\nyour progress with.",
                                    ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(small),
                            child: Icon(Icons.send_rounded, color: lightColor2.withOpacity(0.8),size: medium*1.5,),
                          ),
                        ],
                      )),
                ),
              ))),
    );
  }
}

List<Map<String, String>> friendsList = [
  {"name": "Anubhav Sakhuja", "username": "@user1", "uid": "the uid", "per": "35.7"},
  {"name": "Tannushri Chander", "username": "@user2", "uid": "the uid", "per": "55"},
  {"name": "Akshit Khandelwal", "username": "@user33", "uid": "the uid", "per": "10"},
  {"name": "Tannushri Chander", "username": "@user22", "uid": "the uid", "per": "55"},
  {"name": "Akshit Khandelwal", "username": "@user333", "uid": "the uid", "per": "10"},
  {"name": "Tannushri Chander", "username": "@user222", "uid": "the uid", "per": "55"},
  {"name": "Akshit Khandelwal", "username": "@user3333", "uid": "the uid", "per": "10"},
  {"name": "Raghav Kumar chaurasia", "username": "@user4", "uid": "the uid", "per": "85"},
  {"name": "Bhola Baba", "username": "@user5", "uid": "the uid", "per": "100"},
];
// List<Map<String, String>>? friendsList;
