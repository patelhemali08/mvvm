import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {

  TextEditingController? controller;
  TextInputType? Textinputtype;

  String? text;
  bool obscureText = false;


  Mytextfield ({super.key,this.controller,this.Textinputtype,this.text,required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(

    decoration: InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
                ),
            hintText: text),
        obscureText:obscureText,
        controller: controller,
        keyboardType:Textinputtype
      );
  }
}
