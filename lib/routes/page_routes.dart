import 'package:flutter/material.dart';
import 'package:simpati_bot/screens/home_page.dart';
import 'package:simpati_bot/screens/login_page.dart';
import 'package:simpati_bot/screens/register_page.dart';
import 'package:simpati_bot/screens/splash_page.dart';
import 'package:simpati_bot/screens/getStarted_page.dart';
import 'package:simpati_bot/screens/welcome_page.dart';

class PageRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_page',
      routes: {
        '/splash': (context) => Splash(),
        '/getStarted_page': (context) => GetStartedPage(),
        '/welcome_page': (context) => WelcomePage(),
        '/register_page': (context) => RegisterPage(),
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => HomePage(),
        '/drawer_page': (context) => Drawer(),
      },
    );
  }
}
