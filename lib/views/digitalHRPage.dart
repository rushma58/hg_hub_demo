import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/reusable/gridItem.dart';

class DigitalHRPage extends StatefulWidget {
  const DigitalHRPage({super.key});

  @override
  State<DigitalHRPage> createState() => _DigitalHRPageState();
}

class _DigitalHRPageState extends State<DigitalHRPage> {
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
              appBarName: "Digital HR",
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
                            "assets/icons/LetterRequest.png",
                          ),
                          gridText: "Letter Request"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/LetterList.png"),
                          gridText: "My Letter List"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/HandBook.png"),
                          gridText: "Hand Book"),
                    ],
                  ),
                  Row(
                    children: [
                      GridItem(
                          gridIcon: Image.asset(
                            "assets/icons/PolicyDocuments.png",
                          ),
                          gridText: "Policy Document"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/NewsLetter.png"),
                          gridText: "News Letter"),
                      Spacer(),
                      GridItem(
                          gridIcon: Image.asset("assets/icons/Vacancy.png"),
                          gridText: "Vacancies"),
                    ],
                  ),
                  Row(
                    children: [
                      GridItem(
                          gridIcon: Image.asset(
                            "assets/icons/FAQ.png",
                          ),
                          gridText: "FAQs"),
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
