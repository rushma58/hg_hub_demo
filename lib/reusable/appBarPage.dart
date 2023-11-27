import 'package:flutter/material.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/homePage.dart';

class TopAppBar extends StatelessWidget {
  final String appBarName;
  final bool filterRequired;
  const TopAppBar(
      {super.key, required this.appBarName, required this.filterRequired});

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
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: filterRequired
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: cBlue,
                  ),
                )
              : SizedBox(width: 15),
        )
      ],
      backgroundColor: cWhite,
    );
  }
}
