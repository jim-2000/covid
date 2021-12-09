import 'package:covid/screens/homeScreen.dart';
import 'package:covid/screens/introScreen.dart';
import 'package:covid/style/AppTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID',
      theme: APPtheme.dark(),
      home: const IntroScreen(),
    );
  }
}
//   keytool -genkey -v -keystore H:\Flutter\api\covid\keys\keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias jim

