import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  PrimaryButton({this.onPressed, this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 46,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: Pallete.primaryColor,
        elevation: 15,
        label: Text(
          label,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
