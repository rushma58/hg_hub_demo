import 'package:flutter/material.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/homePage.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class LeaveRequestForm extends StatefulWidget {
  const LeaveRequestForm({super.key});

  @override
  State<LeaveRequestForm> createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  TextEditingController _dateNepaliStart = TextEditingController();
  TextEditingController _dateNepaliEnd = TextEditingController();
  int radioLeaveOption = 0;

  Future<void> setNepaliStartDate(BuildContext context) async {
    NepaliDateTime? datePicked = await showMaterialDatePicker(
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2060),
      lastDate: NepaliDateTime(2090),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (datePicked != null) {
      setState(() {
        _dateNepaliStart.text =
            NepaliDateFormat('yyyy-MM-dd').format(datePicked);
      });
    }
  }

  Future<void> setNepaliEndDate(BuildContext context) async {
    NepaliDateTime? datePicked = await showMaterialDatePicker(
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2060),
      lastDate: NepaliDateTime(2090),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (datePicked != null) {
      setState(() {
        _dateNepaliEnd.text = NepaliDateFormat('yyyy-MM-dd').format(datePicked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            "Leave Request",
            style: fTitle_blue,
          ),
        ),
        backgroundColor: cWhite,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/background/background3.jpg',
                fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Leave",
                        style: fRegular_blue_bold,
                      ),
                      Switch(
                        activeColor: Colors.purple,
                        activeTrackColor: Colors.purpleAccent,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: cGray,
                        value: false,
                        onChanged: (bool value) {},
                      ),
                      Text(
                        "Work on Holiday",
                        style: fRegular_blue_bold,
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Select Leave Type",
                      labelStyle: fSmall_gray_bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "*Note: Every Leave Shows (Remaining Leave/Total Leave)",
                      style: fSmall_gray,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "BS",
                        style: fRegular_blue_bold,
                      ),
                      Switch(
                        activeColor: Colors.purple,
                        activeTrackColor: Colors.purpleAccent,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: cGray,
                        value: false,
                        onChanged: (bool value) {},
                      ),
                      Text(
                        "AD",
                        style: fRegular_blue_bold,
                      )
                    ],
                  ),
                  TextFormField(
                    controller: _dateNepaliStart,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Start Date (B.S)",
                      labelStyle: fSmall_gray_bold,
                      suffixIconColor: cBlue,
                      suffixIcon: IconButton(
                        onPressed: () => setNepaliStartDate(context),
                        icon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _dateNepaliEnd,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "End Date (B.S)",
                      labelStyle: fSmall_gray_bold,
                      suffixIconColor: cBlue,
                      suffixIcon: IconButton(
                        onPressed: () => setNepaliEndDate(context),
                        icon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: radioLeaveOption,
                        onChanged: (onChanged) {},
                        activeColor: cBlue,
                        focusColor: cBlue,
                      ),
                      Text("Full Day", style: fSmall_blue_bold),
                      Spacer(),
                      Radio(
                        value: true,
                        groupValue: radioLeaveOption,
                        onChanged: (onChanged) {},
                        activeColor: cBlue,
                        focusColor: cBlue,
                      ),
                      Text("1st Half", style: fSmall_blue_bold),
                      Spacer(),
                      Radio(
                        value: true,
                        groupValue: radioLeaveOption,
                        onChanged: (onChanged) {},
                        activeColor: cBlue,
                        focusColor: cBlue,
                      ),
                      Text("2nd Half", style: fSmall_blue_bold),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Remarks",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      // style: ElevatedButton.styleFrom(
                      //   primary: Colors.green, // Background color
                      // ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(300.0, 40.0)), // Set the width and height
                        backgroundColor: MaterialStateProperty.all(
                            Colors.green), // Set the background color
                      ),
                      child: Text(
                        "Apply",
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
