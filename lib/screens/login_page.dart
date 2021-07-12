import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati_bot/screens/alertBox.dart';
import 'package:simpati_bot/services/auth/auth_services.dart';
import 'package:simpati_bot/utils/colorPallete.dart';
import 'package:simpati_bot/widgets/inputForm.dart';
import 'package:simpati_bot/widgets/primaryButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

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
            child: SingleChildScrollView(
              child: Column(
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Lupa Password ?",
                            style: TextStyle(
                                color: Pallete.primaryColor,
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  isLoading
                      ? SpinKitFadingCircle(
                          color: Pallete.primaryColor,
                          size: 45,
                        )
                      : PrimaryButton(
                          label: "Login",
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await AuthServices.signIn(emailController.text,
                                    passwordController.text)
                                .then((result) {
                              if (result != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AlertBox(
                                              title: "Login Failed",
                                              content: result.toString(),
                                            )));
                                emailController.clear();
                                passwordController.clear();
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                print(result.toString());
                                emailController.clear();
                                passwordController.clear();
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            });
                          },
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      label: "Register",
                      onPressed: () {
                        Navigator.pushNamed(context, '/register_page');
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
