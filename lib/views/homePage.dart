import 'package:flutter/material.dart';
import 'package:hg_hub_demo/views/loginForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Center(child: Text("Welcome")),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginForm()));
              },
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),

      //Drawer
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
              thickness: 0.5,
            ),
          ],
        ),
      ),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Rijwol Shakya",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Life is what happens when you're busy making other plans. - John Lennon",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Check-In :...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black54),
                ),
                Spacer(),
                Text(
                  "Check-Out :...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Attendance Details (2080/8)",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
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
                Text(
                  "App Version 1.2",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Check-In"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    GridItem(
                        gridIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                        gridText: "Leave Request"),
                    GridItem(
                        gridIcon: Icon(Icons.calendar_today_outlined,
                            color: Colors.white),
                        gridText: "Reports & List"),
                    GridItem(
                        gridIcon: Icon(Icons.leave_bags_at_home_outlined,
                            color: Colors.white),
                        gridText: "People on Leave"),
                  ],
                ),
                Row(
                  children: [
                    GridItem(
                        gridIcon:
                            Icon(Icons.book_outlined, color: Colors.white),
                        gridText: "Highland Library"),
                    GridItem(
                        gridIcon:
                            Icon(Icons.computer_outlined, color: Colors.white),
                        gridText: "Digital HR"),
                    GridItem(
                        gridIcon: Icon(Icons.content_paste_search_outlined,
                            color: Colors.white),
                        gridText: "Vacancies"),
                  ],
                ),
                Row(
                  children: [
                    GridItem(
                        gridIcon: Icon(Icons.laptop_chromebook_outlined,
                            color: Colors.white),
                        gridText: "Highland LMS"),
                  ],
                ),
              ],
            )
          ]),
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
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Icon gridIcon;
  final String gridText;

  const GridItem({Key? key, required this.gridIcon, required this.gridText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 85,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              gridIcon,
              SizedBox(height: 5),
              Text(
                gridText,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
