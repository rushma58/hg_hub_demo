import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';

class PeopleOnLeavePage extends StatefulWidget {
  const PeopleOnLeavePage({super.key});

  @override
  State<PeopleOnLeavePage> createState() => _PeopleOnLeavePageState();
}

class _PeopleOnLeavePageState extends State<PeopleOnLeavePage> {
  bool customIcon1 = false;
  bool customIcon2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              TopAppBar(
                appBarName: "People on Leave",
                filterRequired: true,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      //initiallyExpanded: true,
                      collapsedBackgroundColor: cWhite,
                      backgroundColor: cWhite,
                      expandedAlignment: Alignment.centerLeft,
                      collapsedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      title: Text(
                        "On Leave",
                        style: fRegular_blue_bold,
                      ),
                      trailing: Icon(
                        customIcon1
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: cBlue,
                      ),
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(
                              "Anu Thapa Magar (City Office)",
                              style: fSmall_white_bold,
                            ),
                            subtitle: Text(
                              "2080-8-10 to 2080-8-15",
                              style: fSmall_white,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            tileColor: cGreen,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              "Anu Thapa Magar (City Office)",
                              style: fSmall_white_bold,
                            ),
                            subtitle: Text(
                              "2080-8-10 to 2080-8-15",
                              style: fSmall_white,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            tileColor: cGreen,
                          ),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => customIcon1 = expanded);
                      },
                    ),
                    SizedBox(height: 10),

                    //Expansion 2
                    ExpansionTile(
                      //initiallyExpanded: true,
                      collapsedBackgroundColor: cWhite,
                      backgroundColor: cWhite,
                      expandedAlignment: Alignment.centerLeft,
                      collapsedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      title: Text(
                        "Absent",
                        style: fRegular_blue_bold,
                      ),
                      trailing: Icon(
                        customIcon2
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: cBlue,
                      ),
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(
                              "Rijwol Shakya",
                              style: fSmall_white_bold,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            tileColor: cBlue,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              "Rijwol Shakya",
                              style: fSmall_white_bold,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            tileColor: cBlue,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              "Rijwol Shakya",
                              style: fSmall_white_bold,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            tileColor: cBlue,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              "Rijwol Shakya",
                              style: fSmall_white_bold,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            tileColor: cBlue,
                          ),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => customIcon2 = expanded);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
