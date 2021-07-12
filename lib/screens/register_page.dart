import 'package:flutter/material.dart';
import 'package:simpati_bot/screens/register_second_page.dart';
import 'package:simpati_bot/utils/colorPallete.dart';
import 'package:simpati_bot/widgets/inputForm.dart';
import 'package:simpati_bot/widgets/primaryButton.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
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
                    height: 50,
                  ),
                  Image(
                    height: 150,
                    width: 190,
                    image: AssetImage(
                      'lib/assets/images/register-bg.png',
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Mohon Mengisi data diri anda",
                    style: TextStyle(
                        color: Pallete.primaryColor,
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputForm(
                    label: "Nama Lengkap",
                    controller: nameController,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputForm(
                    label: "Jurusan",
                    controller: jurusanController,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 40,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 74, left: 74),
                    child: PrimaryButton(
                      label: "Continue",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterSecondPage(
                              nameController: nameController,
                              emailController: emailController,
                              passwordController: passwordController,
                              jurusanController: jurusanController,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
