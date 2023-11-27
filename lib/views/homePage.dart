import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/gridItem.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/loginForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isCheckedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.key),
              title: Text("Change Password"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.south),
              title: Text("Check for Updates"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit App"),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
      //Body
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background/background2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                            icon: Icon(Icons.view_headline_rounded),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          )),
                      Spacer(),
                      Text(
                        "Welcome!",
                        style: fWelcome_white,
                      ),
                      Spacer(),
                      Container(
                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginForm()));
                              },
                              icon: Icon(Icons.logout)))
                    ],
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Rijwol Shakya", style: fTitle_white),
                    ),
                  ),
                  SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Life is what happens when you're busy making other plans. - John Lennon",
                          style: fSmall_gray_bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Check-In :...", style: fSmall_white_bold),
                      Spacer(),
                      Text("Check-Out :...", style: fSmall_white_bold),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Attendance Details (2080/8)",
                            style: fRegular_blue_bold,
                            textAlign: TextAlign.start,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          //Reusable
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  children: [
                                    TextItem(text: "Late In: 0"),
                                    TextItem(text: "Early Out: 0"),
                                    TextItem(text: "Leave: 0"),
                                    TextItem(text: "Absent: 0")
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child:
                              Text("App Version 4.6", style: fSmall_blue_bold),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        child: Icon(
                          Icons.refresh,
                          color: cBlue,
                        ),
                        backgroundColor: cWhite,
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isCheckedIn = !isCheckedIn;
                          });
                        },
                        child: Text(isCheckedIn ? "Check-Out" : "Check-In"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              // Change button color based on isCheckedIn state
                              return isCheckedIn ? cRed : Colors.green;
                            },
                          ),
                        ),
                        //style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => null)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // GridItem(
                  //     gridIcon: Image.asset("assets/icons/CalendarPlus.png"),
                  //     gridText: "Leave Request"),
                  Column(
                    children: [
                      Row(
                        children: [
                          GridItem(
                              gridIcon: Image.asset(
                                "assets/icons/CalendarPlus.png",
                              ),
                              gridText: "Leave Request"),
                          Spacer(),
                          GridItem(
                              gridIcon:
                                  Image.asset("assets/icons/Calendar.png"),
                              gridText: "Reports & List"),
                          Spacer(),
                          GridItem(
                              gridIcon:
                                  Image.asset("assets/icons/PeopleOnLeave.png"),
                              gridText: "People on Leave"),
                        ],
                      ),
                      Row(
                        children: [
                          GridItem(
                              gridIcon: Image.asset("assets/icons/Library.png"),
                              gridText: "Highland Library"),
                          Spacer(),
                          GridItem(
                              gridIcon: Image.asset(
                                  "assets/icons/SystemInformation.png"),
                              gridText: "Digital HR"),
                          Spacer(),
                          GridItem(
                              gridIcon: Image.asset("assets/icons/Vacancy.png"),
                              gridText: "Vacancies"),
                        ],
                      ),
                      Row(
                        children: [
                          GridItem(
                              gridIcon:
                                  Image.asset("assets/icons/E-Learning.png"),
                              gridText: "Highland LMS"),
                        ],
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  final String text;

  const TextItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      child: Container(
        decoration: BoxDecoration(
          color: cBlue,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            style: fSmall_white_bold,
          ),
        ),
      ),
    );
  }
}
