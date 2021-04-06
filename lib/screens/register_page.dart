import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class RegisterPage extends StatelessWidget {
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
              children: [Text("REGISTER PAGE")],
            ),
          ),
        ),
      ),
    );
  }
}
