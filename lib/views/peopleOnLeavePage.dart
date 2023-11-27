import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/utilities/colors.dart';

class PeopleOnLeavePage extends StatefulWidget {
  const PeopleOnLeavePage({super.key});

  @override
  State<PeopleOnLeavePage> createState() => _PeopleOnLeavePageState();
}

class _PeopleOnLeavePageState extends State<PeopleOnLeavePage> {
  bool customIcon = false;

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
              TopAppBar(appBarName: "People on Leave"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      backgroundColor: cWhite,
                      title: Text("On Leave"),
                      trailing: Icon(customIcon
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                      children: [
                        ListTile(
                          title: Column(
                            children: [
                              Text(
                                "Omkar Patrabansas",
                                textAlign: TextAlign.left,
                              ),
                              Text("Omkar Patrab"),
                            ],
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Column(
                            children: [
                              Text(
                                "Omkar Patrabansas",
                                textAlign: TextAlign.left,
                              ),
                              Text("Omkar Patrab"),
                            ],
                          ),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => customIcon = expanded);
                      },
                    ),
                    SizedBox(height: 10),
                    ExpansionTile(
                      backgroundColor: cWhite,
                      title: Text("Absent"),
                      trailing: Icon(customIcon
                          ? Icons.arrow_upward
                          : Icons.arrow_downward),
                      children: [
                        ListTile(
                          title: Text("Rijwol Shakya"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Rijwol Shakya"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Rijwol Shakya"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Rijwol Shakya"),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() => customIcon = expanded);
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
