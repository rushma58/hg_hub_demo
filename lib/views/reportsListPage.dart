import 'package:flutter/material.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/gridItem.dart';
import 'package:hg_hub_demo/views/homePage.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({super.key});

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: cBlue,
            )),
        elevation: 0,
        title: Center(
          child: Text(
            "Leave Request",
            style: fTitle_blue,
          ),
        ),
        backgroundColor: cWhite,
      ),
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
          Row(
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
          )
        ],
      ),
    );
  }
}
