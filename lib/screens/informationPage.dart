import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  final String title;
  final AssetImage newsImage;
  final String description;
  InformationPage({this.title, this.newsImage, this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.0,
                    vertical: 15.0,
                  ),
                  child: Container(
                    height: 180.0,
                    width: 340.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: newsImage,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(title,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Nunito',
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                )),
            SizedBox(height: 5.0),
            Row(children: [
              Text("Simpati Team",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                  )),
            ]),
            SizedBox(
              height: 20.0,
              width: 12,
            ),
            Text(description,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 25.0)
          ],
        ),
      ),
    );
  }
}
