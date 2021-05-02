import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simpati_bot/services/auth/auth_services.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class SideNav extends StatefulWidget {
  final Widget nameHeader;
  final Widget emailHeader;
  SideNav({this.emailHeader, this.nameHeader});

  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  final String userUID = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                accountName: widget.nameHeader,
                accountEmail: widget.emailHeader,
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                ),
                decoration: BoxDecoration(
                  color: Pallete.primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/ic_nim.png'))),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NIM",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(userUID)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var name = snapshot.data;
                          return Text(
                            name["nim"],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          );
                        }
                        return Text("Loading");
                      },
                    ),
                  ],
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/images/ic_classroom.png'))),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kelas",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(userUID)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var name = snapshot.data;
                          return Text(
                            name["kelas"],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          );
                        }
                        return Text("Loading");
                      },
                    ),
                  ],
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/images/ic_programstudi.png'))),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Program Studi",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(userUID)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var name = snapshot.data;
                          return Text(
                            name["jurusan"],
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          );
                        }
                        return Text("Loading");
                      },
                    ),
                  ],
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 50,
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                onTap: () async {
                  await AuthServices.signOut();
                  setState(() {
                    Navigator.pushNamed(context, '/getStarted_page');
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
