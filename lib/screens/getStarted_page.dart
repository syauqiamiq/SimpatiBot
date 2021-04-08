import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

import 'package:simpati_bot/widgets/secondaryButton.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Container(
          color: Pallete.primaryColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
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
              Text(
                "(Sistem Panduan Otomatis)",
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 150,
              ),
              SecondaryButton(
                label: "GET STARTED",
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome_page');
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
