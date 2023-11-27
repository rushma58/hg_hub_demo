import 'package:flutter/material.dart';
import 'package:hg_hub_demo/reusable/appBarPage.dart';
import 'package:hg_hub_demo/reusable/gridItem.dart';

class HighlandLibraryPage extends StatefulWidget {
  const HighlandLibraryPage({super.key});

  @override
  State<HighlandLibraryPage> createState() => _HighlandLibraryPageState();
}

class _HighlandLibraryPageState extends State<HighlandLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/Library4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            TopAppBar(
              appBarName: "Highland Library",
              filterRequired: false,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  GridItem(
                      gridIcon: Image.asset(
                        "assets/icons/BorrowBook.png",
                      ),
                      gridText: "Borrow Book"),
                  Spacer(),
                  GridItem(
                      gridIcon: Image.asset("assets/icons/BookList.png"),
                      gridText: "My Borrow List"),
                  Spacer(),
                  GridItem(
                      gridIcon: Image.asset("assets/icons/ReadersList.png"),
                      gridText: "Readers List"),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
