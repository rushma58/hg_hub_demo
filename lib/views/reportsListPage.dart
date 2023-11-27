import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/reusable/gridItem.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({super.key});

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            TopAppBar(appBarName: "Reports & Lists"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GridItem(
                      gridIcon: Image.asset(
                        "assets/icons/Leave.png",
                      ),
                      gridText: "My Leave"),
                  Spacer(),
                  GridItem(
                      gridIcon: Image.asset("assets/icons/Planner.png"),
                      gridText: "My Attendance"),
                  Spacer(),
                  GridItem(
                      gridIcon: Image.asset("assets/icons/HolidayList.png"),
                      gridText: "Holiday List"),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
