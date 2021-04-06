import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/getStarted_page'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        color: Pallete.primaryColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/assets/images/logo.png'),
              height: 150,
              width: 170,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "SIMPATI",
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 8),
            ),
            Text(
              "BOT",
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 5),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitWave(
              color: Colors.black,
              size: 35,
            )
          ],
        ),
      )),
    );
  }
}
