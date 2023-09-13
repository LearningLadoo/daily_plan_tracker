import 'dart:convert';

import 'package:daily_plan_tracker/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final ScrollController _controllerBase = ScrollController();
  final ScrollController _controllerTime = ScrollController();

  @override
  void initState() {
    // Syncing the lists
    _controllerBase.addListener(() {
      if (_controllerBase.hasClients && _controllerTime.hasClients) {
        _controllerTime.jumpTo(_controllerBase.offset);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: small),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60 + 30, left: 40),
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              controller: _controllerTime,
              child: SizedBox(
                height: 60 * 25 - 30,
                width: screenWidth,
                child: Stack(
                  children: timeSlots.map((slot) {
                    Map s = jsonDecode(slot);
                    String twoDigits(int n) => n.toString().padLeft(2, "0");
                    return Positioned(
                      top: s["start"] * 1.0,
                      child: Container(
                        height: s["end"] * 1.0 - s["start"],
                        width: screenWidth-60,
                        decoration: BoxDecoration(
                          color: lightColor2.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(small / 4),
                        ),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "${twoDigits(s["start"] ~/ 60)}:${twoDigits(s["start"].remainder(60))} to ${twoDigits(s["end"] ~/ 60)}:${twoDigits(s["end"].remainder(60))}, ${twoDigits((s["end"] - s["start"]))} min ",
                              style: themeData.textTheme.bodySmall!.copyWith(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          CustomScrollView(controller: _controllerBase, slivers: [
            SliverStickyHeader(
              header: Container(
                height: 60.0,
                color: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #0',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Opacity(
                    opacity: 0.5,
                    child: SizedBox(
                      height: 60,
                      width: screenWidth,
                      child: Row(
                        children: [
                          Text("${"$i".padLeft(2, "0")}:00"),
                          SizedBox(
                            width: small / 2,
                          ),
                          Expanded(child: Divider(color: lightColor1)),
                        ],
                      ),
                    ),
                  ),
                  childCount: 25,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

List<String> timeSlots = [
  "{ \"start\": 0, \"end\": 100, \"note\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula lectus ac tellus vulputate.\" }",
  "{ \"start\": 120, \"end\": 200, \"note\": \"Aenean vel justo in erat malesuada vulputate sed ac libero. Nulla facilisi.\" }",
  "{ \"start\": 240, \"end\": 310, \"note\": \"Cras feugiat orci nec nisl lacinia, sit amet sollicitudin justo auctor. Maecenas nec lorem id libero malesuada dapibus.\" }",
  "{ \"start\": 360, \"end\": 390, \"note\": \"Quisque auctor tellus eu libero posuere congue. Integer tristique, justo eget eleifend consectetur, est justo lacinia felis.\" }",
  "{ \"start\": 480, \"end\": 550, \"note\": \"Vestibulum volutpat libero eu justo auctor bibendum. Sed vehicula, velit eget dictum elementum, felis arcu tincidunt velit.\" }",
  "{ \"start\": 600, \"end\": 720, \"note\": \"Phasellus euismod justo vel augue feugiat, at congue odio laoreet. Fusce ullamcorper libero vel mattis aliquam.\" }",
  "{ \"start\": 850, \"end\": 900, \"note\": \"Suspendisse potenti. Fusce vitae dui vel arcu semper rhoncus a sed elit. Fusce eu lacinia purus.\" }",
  "{ \"start\": 1200, \"end\": 1440, \"note\": \"Nullam auctor elit eu libero eleifend, quis feugiat metus hendrerit. Morbi hendrerit quam a ante aliquet dignissim.\" }"
];
