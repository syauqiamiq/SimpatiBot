import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';
import 'package:simpati_bot/widgets/inputForm.dart';
import 'package:simpati_bot/widgets/primaryButton.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              Column(
                children: [
                  SizedBox(
                    height: 76,
                  ),
                  Image(
                    height: 122,
                    width: 236,
                    image: AssetImage('lib/assets/images/login-bg.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Selamat Datang di\n SIMPATI BOT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Pallete.primaryColor,
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  InputForm(
                    label: "Email",
                    controller: emailController,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputForm(
                    label: "Password",
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                    label: "Login",
                    onPressed: () {
                      Navigator.pushNamed(context, '/home_page');
                    },
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
