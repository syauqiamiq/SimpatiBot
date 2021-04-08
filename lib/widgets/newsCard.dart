import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String newsContent;
  final AssetImage newsImage;

  NewsCard({this.newsTitle, this.newsContent, this.newsImage});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            color: Pallete.primaryColor,
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
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
