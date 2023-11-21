import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hg_hub_demo/views/homePage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome To",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "HG-HUB",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),

              //logo
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset("images/logo.jpeg"),
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
                        icon: const Icon(
                          Icons.person,
                          color: Colors.blueAccent,
                        ),
                        labelText: "Enter Your Username",
                        labelStyle:
                            TextStyle(color: Colors.blueAccent, fontSize: 14),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.security,
                          color: Colors.blueAccent,
                        ),
                        labelText: "Enter Your Password",
                        labelStyle:
                            TextStyle(color: Colors.blueAccent, fontSize: 14),
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
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _getLocation();
                              //TODO
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(45, 4, 45, 4),
                              child: Text("Login"),
                            )),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
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
                    Text(
                      "App Version 1.2.3",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Check For Updates",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
