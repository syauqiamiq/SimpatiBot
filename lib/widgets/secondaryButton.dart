import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  SecondaryButton({this.onPressed, this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 46,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        elevation: 15,
        label: Text(
          label,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
