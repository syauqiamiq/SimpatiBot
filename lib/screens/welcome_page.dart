import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: ListView(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/welcome-bg.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Image(
                      image: AssetImage('lib/assets/images/chat-bg.png'),
                      width: 230,
                      height: 270,
                    ),
                    SizedBox(
                      height: 58,
                    ),
                    DottedBorder(
                      strokeWidth: 1,
                      color: Colors.black,
                      padding: EdgeInsets.all(5),
                      radius: Radius.circular(10),
                      dashPattern: [6],
                      borderType: BorderType.RRect,
                      child: Text(
                        "Tanya Berbagai Topik \nMengenai Lab IT UMM",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 40,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login_page');
                            },
                            backgroundColor: Colors.white,
                            elevation: 15,
                            label: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 40,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register_page');
                            },
                            backgroundColor: Colors.white,
                            elevation: 15,
                            label: Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
