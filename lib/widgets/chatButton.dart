import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class ChatButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Widget icon;
  ChatButton({this.onPressed, this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 60,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: Pallete.primaryCleanColor,
        icon: icon,
        elevation: 15,
        label: Text(
          label,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
