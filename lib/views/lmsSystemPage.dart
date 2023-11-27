import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/reusable/gridItem.dart';

class LMSSytemPage extends StatefulWidget {
  const LMSSytemPage({super.key});

  @override
  State<LMSSytemPage> createState() => _LMSSytemPageState();
}

class _LMSSytemPageState extends State<LMSSytemPage> {
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
            TopAppBar(
              appBarName: "LMS System",
              filterRequired: false,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GridItem(
                          gridIcon: Image.asset(
                            "assets/icons/Course1.png",
                          ),
                          gridText: "Courses"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/Tutorials.png"),
                          gridText: "Tutorial"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/Quiz.png"),
                          gridText: "Quizes"),
                    ],
                  ),
                  Row(
                    children: [
                      GridItem(
                          gridIcon: Image.asset(
                            "assets/icons/ReadingMaterial.png",
                          ),
                          gridText: "Reading Material"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/Articles.png"),
                          gridText: "Article"),
                      Spacer(),
                      GridItem(
                          gridIcon:
                              Image.asset("assets/icons/LearningRequest.png"),
                          gridText: "Learning Request"),
                    ],
                  ),
                  Row(
                    children: [
                      GridItem(
                          gridIcon: Image.asset(
                            "assets/icons/SubmittedApplication.png",
                          ),
                          gridText: "Learning List"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/OnBoarding.png"),
                          gridText: "About Company"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
