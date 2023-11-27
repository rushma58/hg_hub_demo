import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/reusable/gridItem.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/background3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              TopAppBar(appBarName: "Vacancy", filterRequired: false),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Categories",
                            style: fRegular_blue_bold,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GridItem(
                            gridIcon: Image.asset(
                              "assets/icons/LetterRequest.png",
                            ),
                            gridText: "Letter Request"),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Files",
                            style: fRegular_blue_bold,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: ListTile(
                        title: Text("File name.pdf", style: fRegular_blue_bold),
                        trailing: Icon(
                          Icons.picture_as_pdf,
                          color: cBlue,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
