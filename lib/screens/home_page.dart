import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';
import 'package:simpati_bot/widgets/chatButton.dart';
import 'package:simpati_bot/widgets/newsCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[
            Container(
              color: Pallete.primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
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
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/yuda.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 216,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Muhammad Prayuda Riansyah",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Teknik Informatika",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )
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
                maxChildSize: 0.7,
                minChildSize: 0.7,
                builder: (BuildContext context, myScrollController) {
                  return ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: ListView(
                        controller: myScrollController,
                        children: [
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
                    onPressed: () {},
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
