import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati_bot/screens/alertBox.dart';
import 'package:simpati_bot/services/auth/auth_services.dart';
import 'package:simpati_bot/utils/colorPallete.dart';
import 'package:simpati_bot/widgets/inputForm.dart';
import 'package:simpati_bot/widgets/primaryButton.dart';

class RegisterSecondPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController jurusanController;

  RegisterSecondPage(
      {this.nameController,
      this.emailController,
      this.passwordController,
      this.jurusanController});
  @override
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  String kelasController;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  bool isLoading = false;
  String dropdownContent = "KELAS";

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
                    height: 50,
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
                    label: "Nomor Telephone",
                    controller: phoneController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputForm(
                    label: "NIM",
                    controller: nimController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 280,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[400])),
                    child: DropdownButton<String>(
                      hint: Text(
                        dropdownContent,
                        style: TextStyle(
                            color: Pallete.primaryColor,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600),
                      ),
                      isExpanded: true,
                      underline: Container(color: Colors.transparent),
                      items: <String>[
                        'A',
                        'B',
                        'C',
                        'D',
                        'E',
                        'F',
                        'G',
                        'H',
                        'I',
                        'J',
                        'K'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          kelasController = newValue;
                          dropdownContent = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 74, left: 74),
                      child: isLoading
                          ? SpinKitFadingCircle(
                              color: Pallete.primaryColor,
                              size: 45,
                            )
                          : PrimaryButton(
                              label: "Daftar",
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                FirebaseFirestore db =
                                    FirebaseFirestore.instance;
                                CollectionReference users =
                                    db.collection('users');
                                await AuthServices.signUp(
                                        widget.emailController.text,
                                        widget.passwordController.text)
                                    .then((result) {
                                  if (result == null) {
                                    print(result);
                                    print(widget.emailController.text);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlertBox(
                                                  title: "Register Failed",
                                                  content: result.toString(),
                                                )));
                                    widget.nameController.clear();
                                    widget.emailController.clear();
                                    widget.jurusanController.clear();
                                    widget.passwordController.clear();
                                    setState(() {
                                      isLoading = false;
                                    });
                                  } else {
                                    print("signup sukses");
                                    users.doc(result.uid).set({
                                      'nama': widget.nameController.text,
                                      'email': widget.emailController.text,
                                      'jurusan': widget.jurusanController.text,
                                      'uid': result.uid,
                                      'noTelp': phoneController.text,
                                      'nim': nimController.text,
                                      'kelas': kelasController,
                                    });
                                    widget.nameController.clear();
                                    widget.emailController.clear();
                                    widget.jurusanController.clear();
                                    widget.passwordController.clear();
                                    setState(() {
                                      isLoading = false;
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    });
                                  }
                                });
                              },
                            )),
                  SizedBox(
                    height: 70,
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
