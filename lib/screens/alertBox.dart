import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class AlertBox extends StatelessWidget {
  final String title;
  final String content;
  AlertBox({this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: AlertDialog(
          title: Text(title),
          content: Text(content),
          elevation: 20,
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Pallete.primaryColor),
              ),
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
