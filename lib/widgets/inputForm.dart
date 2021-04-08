import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class InputForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  InputForm({this.label, this.controller, this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 50,
      color: Colors.white,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        autocorrect: false,
        style: TextStyle(color: Colors.black, fontSize: 12),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Pallete.primaryColor,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Pallete.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
