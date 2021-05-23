import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String newsContent;
  final AssetImage newsImage;

  NewsCard({this.newsTitle, this.newsContent, this.newsImage});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(1, 0.5))
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image(
                    width: 100,
                    height: 80,
                    image: newsImage,
                  ),
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          newsContent,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class ModernNewsCard extends StatelessWidget {
  final String newsTitle;
  final String newsContent;
  final AssetImage newsImage;
  final Function onTab;
  ModernNewsCard(
      {this.newsTitle, this.newsContent, this.newsImage, this.onTab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: onTab,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Ink.image(
                      height: 150,
                      image: newsImage,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 15, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(newsTitle,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontFamily: 'Nunito',
                            fontSize: 14,
                          )),
                      Text(newsContent,
                          style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              fontWeight: FontWeight.w300))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsTitle extends StatelessWidget {
  final String newsTitle;
  final String newsContent;

  NewsTitle({this.newsTitle, this.newsContent});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      child: Text(
        'Simpati Information',
        style: TextStyle(
            color: Colors.blueGrey[700],
            fontFamily: 'Nunito',
            fontSize: 12,
            fontWeight: FontWeight.w900),
      ),
      margin: EdgeInsetsDirectional.only(top: 30),
    );
  }
}
