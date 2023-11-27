import 'package:flutter/material.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/homePage.dart';

class TopAppBar extends StatelessWidget {
  final String appBarName;
  const TopAppBar({super.key, required this.appBarName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          appBarName,
          style: fTitle_blue,
        ),
      ),
      backgroundColor: cWhite,
    );
  }
}
