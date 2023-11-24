import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hg_hub_demo/utilities/colors.dart';
import 'package:hg_hub_demo/utilities/fonts.dart';
import 'package:hg_hub_demo/views/homePage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

// get GPS location
Future<Position> _getLocation() async {
  bool _serviceEnabled;
  LocationPermission _permissionGranted;
  Position _currentLocation;

  // Check if location services are enabled
  _serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!_serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  // Check permission
  _permissionGranted = await Geolocator.checkPermission();
  if (_permissionGranted == LocationPermission.denied) {
    // Request permission
    _permissionGranted = await Geolocator.requestPermission();
    // Request is denied
    if (_permissionGranted == LocationPermission.denied) {
      return Future.error("Location Permission Request are denied");
    }

    // Check if the permission is denied forever
    if (_permissionGranted == LocationPermission.deniedForever) {
      return Future.error("Location Permissions are permanently denied");
    }
  }

  // Get current location
  _currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  // Print all details of the current location
  print('Location Details:');
  print('Latitude: ${_currentLocation.latitude}');
  print('Longitude: ${_currentLocation.longitude}');
  print('Altitude: ${_currentLocation.altitude}');
  print('Accuracy: ${_currentLocation.accuracy}');
  print('Speed: ${_currentLocation.speed}');
  print('Speed Accuracy: ${_currentLocation.speedAccuracy}');
  print('Heading: ${_currentLocation.heading}');
  print('Timestamp: ${_currentLocation.timestamp}');

  // Return the current location
  return _currentLocation;
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // get device information
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> _getDeviceInfo() async {
    AndroidDeviceInfo _androidDeviceInfo = await deviceInfo.androidInfo;

    print('DEVICE INFORMATION:');
    print('Model: ${_androidDeviceInfo.model}');
    print('Device: ${_androidDeviceInfo.device}');
    print('Product: ${_androidDeviceInfo.product}');
    print('Id: ${_androidDeviceInfo.id}');
    // print('System Name: ${_androidDeviceInfo.systemName}');
    // print('System Version: ${_androidDeviceInfo.systemVersion}');

    return await deviceInfo.androidInfo;
  }

  //for connection type
  Future<void> _findConnectivity() async {
    ConnectivityResult connection = await Connectivity().checkConnectivity();

    print('Connectivity Type: $connection');
  }

  Future<void> sendSlackMessage() async {
    // Replace this with your actual Slack webhook URL
    String slackWebhookUrl =
        'https://hooks.slack.com/services/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';

    // Replace this with your   actual username retrieval logic
    String username = ''; // Add your logic to get the username

    // Replace this with your actual location and device information
    Position currentLocation = await _getLocation();
    AndroidDeviceInfo _androidDeviceInfo = await deviceInfo.androidInfo;
    ConnectivityResult connection = await Connectivity().checkConnectivity();

    double currentLatitude = currentLocation.latitude;
    double currentLongitude = currentLocation.longitude;
    String uniqueId = _androidDeviceInfo.id;
    String model = _androidDeviceInfo.model;
    String connectionType = "connection";
    String deviceName = _androidDeviceInfo.device;
    String product = _androidDeviceInfo.product;
    String brand = _androidDeviceInfo.brand;
    //String typeDevice = 'yourTypeDevice';
    //String systemName = 'yourSystemName';
    //String systemVersion = 'yourSystemVersion';

    // Define the request body
    Map<String, dynamic> slackBody = {
      "channel": "#prime-logs",
      "username": username,
      "text": jsonEncode({
        "GPSUrl":
            "https://www.google.com/maps/search/?api=1&query=$currentLatitude,$currentLongitude",
        "GPSx": currentLatitude,
        "GPSy": currentLongitude,
        "UniqueNumber": uniqueId,
        "modelName": model,
        "deviceName": deviceName,
        "product": product,
        "brand": brand,
        //"typeDevice": typeDevice,
        //"systemName": systemName,
        //"systemVersion": systemVersion,
      }),
      "icon_emoji": ":warning:",
    };

    // Create Dio instance
    Dio dio = Dio();

    try {
      // Make a POST request
      Response response = await dio.post(slackWebhookUrl, data: slackBody);

      // Print the response
      print("Response: ${response.statusCode}");
      print("Response Body: ${response.data}");
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/background/background1.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome To",
                    style: fTitle_white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: cWhite,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "HG-HUB",
                        style: fHGHub,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  //logo
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/logo.jpeg"),
                    ),
                  ),

                  //LOGIN FORM
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: cBlue,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: cBlue,
                            labelText: "Enter Your Username",
                            labelStyle: fRegular_blue,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: cBlue,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            prefixIcon: Icon(Icons.security),
                            prefixIconColor: cBlue,
                            labelText: "Enter Your Password",
                            labelStyle: fRegular_blue,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: cWhite,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Remember Me",
                                  style: fSmall_blue_bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    _getLocation();
                                    //_getDeviceInfo();
                                    //_findConnectivity();
                                    //sendSlackMessage();
                                    //TODO
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(70, 5, 70, 5),
                                    child: Text(
                                      "Login",
                                      style: fRegular_white_bold,
                                    ),
                                  )),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.fingerprint),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("App Version 1.2",
                                style: fSmall_blue_bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Check for Updates",
                                style: fSmall_blue_bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
