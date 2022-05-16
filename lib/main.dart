// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:music4mood/screens/aboutus.dart';
import 'package:music4mood/screens/home.dart';
import 'screens/camera.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(trialApp());
}

class trialApp extends StatefulWidget {
  const trialApp({Key? key}) : super(key: key);

  @override
  _trialAppState createState() => _trialAppState();
}

class _trialAppState extends State<trialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "music4mood",
      theme: ThemeData(
        canvasColor: Colors.grey[900],
        primaryColor: Colors.greenAccent[100],
        shadowColor: Colors.black45,
        backgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          titleTextStyle: TextStyle(
              color: Colors.white,
              shadows: const [Shadow(color: Colors.black87)],
              fontFamily: 'Hersheys',
              fontSize: 36.0,
              letterSpacing: 3.0),
        ),
      ),
      home: Home(),
    );
  }
}
