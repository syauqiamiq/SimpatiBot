import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simpati_bot/screens/chat_page.dart';
import 'package:simpati_bot/screens/informationPage.dart';
import 'package:simpati_bot/screens/sidenav_page.dart';
import 'package:simpati_bot/utils/colorPallete.dart';
import 'package:simpati_bot/widgets/chatButton.dart';
import 'package:simpati_bot/widgets/newsCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userUID = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawerEnableOpenDragGesture: true,
        drawer: SideNav(
          nameHeader: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userUID)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var name = snapshot.data;
                return Text(
                  name["nama"],
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                );
              }
              return Text("Loading");
            },
          ),
          emailHeader: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userUID)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var name = snapshot.data;
                return Text(
                  name["noTelp"],
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                );
              }
              return Text("Loading");
            },
          ),
        ),
        body: SafeArea(
          child: Stack(children: <Widget>[
            Container(
              
              color: Pallete.secondaryColor,
              
              
              child: Column(
                
                children: [
                  
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.settings),
                            iconSize: 30,
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[400],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            width: 216,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(userUID)
                                      .snapshots(),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      var name = snapshot.data;
                                      return Text(
                                        name["nama"],
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      );
                                    }
                                    return Text("Loading",
                                    style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                    );
                                  },
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
                                            fontFamily: 'Nunito',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      );
                                    }
                                    return Text("Loading");
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.7,
                maxChildSize: 0.95,
                minChildSize: 0.7,
                builder: (BuildContext context, myScrollController) {
                  return Container(
                    
                    height: 450,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0,-3),
                          blurRadius: 10
                        ),
                      ]
                    ),
                    margin: EdgeInsets.only(top: 40),
                    child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      color: Colors.white70,
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: ListView(
                        controller: myScrollController,
                        children: [
                          ModernNewsCard(
                            newsTitle: "Kenalan Yuk!",
                            newsContent: "Jelajahi fitur-fitur serta berbagai hal menarik lainnya disini.",
                            newsImage: AssetImage('lib/assets/images/kenalanBanner.png'),
                            onTab: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => InformationPage(title: "Kenalan Yuk dengan Simpati Bot dan Cara menggunakannya", newsImage: AssetImage('lib/assets/images/kenalanBanner.png'), description: "Jelajahi fitur-fitur serta berbagai hal menarik lainnya disini.\nCoba tanyakan sekarang:\n\n\t Kapan Praktikum Pbo kelas A?\n \tAtau yang lainnya"),));
                            },
                          ),
                          ModernNewsCard(
                            newsTitle: "Siap Jadi Asisten Kamu!",
                            newsContent: "Simpati  Bot siap menjawab semua pertanyaan kamu mengenai labit, praktikum dan adminitrasi..",
                            newsImage: AssetImage('lib/assets/images/asistenBanner.png'),
                            onTab: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()),);
                            },
                          ),
                          ModernNewsCard(
                            newsTitle: "Kenalan Yuk!",
                            newsContent: "Jelajahi fitur-fitur serta berbagai hal menarik lainnya disini.",
                            newsImage: AssetImage('lib/assets/images/kenalanBanner.png'),
                            onTab: (){},
                          ),
                          NewsTitle(
                            newsTitle: "Simpati Information",
                            newsContent: "Berbagai Informasi Penting yang harus kamu ketahui",
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                          NewsCard(
                            newsTitle: "Teknik Informatika",
                            newsContent:
                                "Teknik Informatika sangat dibutuhkan bagi masa depan",
                            newsImage: AssetImage('lib/assets/images/news.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  );
                  

                }),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChatButton(
                    label: "Chat Now",
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat_page');
                    },
                    icon: Image(
                      image: AssetImage('lib/assets/images/logo.png'),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
