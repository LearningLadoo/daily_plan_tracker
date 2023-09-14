import 'dart:convert';
import 'dart:ui';

import 'package:daily_plan_tracker/common/components.dart';
import 'package:daily_plan_tracker/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

class DaysPage extends StatefulWidget {
  const DaysPage({Key? key}) : super(key: key);

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  final ScrollController _controllerBase = ScrollController();
  final ScrollController _controllerTime = ScrollController();
  double headerHeight = medium*2;
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
      child: Stack(
        children: [
          // time slots in bg
          Container(
            width: screenWidth,
            padding: screenPadding.copyWith(top: 0),
            child: SingleChildScrollView(
              controller: _controllerTime,
              child: Column(
                children: datesList.map((date) {
                  List<String> timeSlots = defaultTimeSlots;
                  return SizedBox(
                    height: 60 * 25 + headerHeight,
                    child: Stack(
                      children: timeSlots.map((slot) {
                        Map s = jsonDecode(slot);
                        String twoDigits(int n) => n.toString().padLeft(2, "0");
                        return Positioned(
                          top: s["start"] * 1.0 + 30 + headerHeight,
                          right: 0,
                          left: small*4,
                          child: Container(
                            height: s["end"] * 1.0 - s["start"],
                            decoration: BoxDecoration(
                              color: lightColor2.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(small / 4),
                            ),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "${twoDigits(s["start"] ~/ 60)}:${twoDigits(
                                      s["start"].remainder(60))} to ${twoDigits(
                                      s["end"] ~/ 60)}:${twoDigits(
                                      s["end"].remainder(60))}, ${twoDigits(
                                      (s["end"] - s["start"]))} min ",
                                  style: themeData.textTheme.bodySmall!
                                      .copyWith(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // the skeleton
          ScrollConfiguration(
            behavior: const CupertinoScrollBehavior(),
            child: CustomScrollView(
                controller: _controllerBase,
                slivers: datesList
                    .map((dateString) {
                  DateTime date = DateFormat("dd-MM-yyyy").parse(dateString);
                  return SliverStickyHeader(
                    header: xGlassBgEffect(child: Container(
                      color: themeData.scaffoldBackgroundColor.withOpacity(0.8),
                      height: headerHeight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat("dd").format(date), style: themeData.textTheme.displaySmall,
                              ),
                              Text(
                                DateFormat("MMM").format(date), style: themeData.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (8).toStringAsFixed(1), style: themeData.textTheme.displaySmall,
                              ),
                              Text(
                                "from 24 hrs", style: themeData.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${(8/24*100).toStringAsFixed(1)}%", style: themeData.textTheme.displaySmall,
                              ),
                              Text(
                                "success", style: themeData.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, i) =>
                            Opacity(
                              opacity: 0.3,
                              child: Container(

                                padding: screenPadding.copyWith(top: 0),
                                height: 60,
                                child: Row(
                                  children: [
                                    Text("${"$i".padLeft(2, "0")}:00"),
                                    SizedBox(
                                      width: small / 2,
                                    ),
                                    Expanded(
                                        child: Divider(color: lightColor1)),
                                  ],
                                ),
                              ),
                            ),
                        childCount: 25,
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

List<String> datesList = List.generate(1, (index) => "${index + 1}-09-2023");
List<String> defaultTimeSlots = [
  "{ \"start\": 0, \"end\": 100, \"note\": \"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula lectus ac tellus vulputate.\" }",
  "{ \"start\": 120, \"end\": 200, \"note\": \"Aenean vel justo in erat malesuada vulputate sed ac libero. Nulla facilisi.\" }",
  "{ \"start\": 240, \"end\": 310, \"note\": \"Cras feugiat orci nec nisl lacinia, sit amet sollicitudin justo auctor. Maecenas nec lorem id libero malesuada dapibus.\" }",
  "{ \"start\": 360, \"end\": 390, \"note\": \"Quisque auctor tellus eu libero posuere congue. Integer tristique, justo eget eleifend consectetur, est justo lacinia felis.\" }",
  "{ \"start\": 480, \"end\": 550, \"note\": \"Vestibulum volutpat libero eu justo auctor bibenduwm. Sed vehicula, velit eget dictum elementum, felis arcu tincidunt velit.\" }",
  "{ \"start\": 600, \"end\": 720, \"note\": \"Phasellus euismod justo vel augue feugiat, at congue odio laoreet. Fusce ullamcorper libero vel mattis aliquam.\" }",
  "{ \"start\": 850, \"end\": 900, \"note\": \"Suspendisse potenti. Fusce vitae dui vel arcu semper rhoncus a sed elit. Fusce eu lacinia purus.\" }",
  "{ \"start\": 1200, \"end\": 1440, \"note\": \"Nullam auctor elit eu libero eleifend, quis feugiat metus hendrerit. Morbi hendrerit quam a ante aliquet dignissim.\" }"
];
