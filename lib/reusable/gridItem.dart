import 'package:flutter/material.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/digitalHRPage.dart';
import 'package:hg_hub_demo/views/highlandLibraryPage.dart';
import 'package:hg_hub_demo/views/leaveRequestPage.dart';
import 'package:hg_hub_demo/views/lmsSystemPage.dart';
import 'package:hg_hub_demo/views/peopleOnLeavePage.dart';
import 'package:hg_hub_demo/views/reportsListPage.dart';
import 'package:hg_hub_demo/views/vacancies.dart';

class GridItem extends StatelessWidget {
  final Image gridIcon;
  final String gridText;

  const GridItem({Key? key, required this.gridIcon, required this.gridText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => gridFunction(context, gridText),
        child: Container(
          width: 115,
          height: 110,
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                gridIcon,
                SizedBox(height: 5),
                Text(
                  gridText,
                  style: fSmall_red_bold,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

gridFunction(BuildContext context, String gridText) {
  if (gridText == "Leave Request") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LeaveRequestForm()));
  }
  if (gridText == "Reports & List") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ReportListPage()));
  }
  if (gridText == "People on Leave") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PeopleOnLeavePage()));
  }
  if (gridText == "Highland Library") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HighlandLibraryPage()));
  }
  if (gridText == "Digital HR") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DigitalHRPage()));
  }
  //TODO
  if (gridText == "Vacancies") {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const VacancyPage()));
  }
  if (gridText == "Highland LMS") {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LMSSytemPage()));
  }
}
