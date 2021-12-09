import 'package:covid/screens/homeScreen.dart';
import 'package:covid/style/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(image: AssetImage("assets/images/transparent.png")),
            ),
            Center(
              child: Text(
                "WELL COME ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 9,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "To COVID-19 STATICS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                letterSpacing: 6,
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Text("loading...")
          ],
        ),
      ),
    );
  }
}
