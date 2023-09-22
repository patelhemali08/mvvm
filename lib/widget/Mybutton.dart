import 'package:flutter/material.dart';
import 'package:mvvmproject/resource/Styleresorce.dart';

class Mybutton extends StatelessWidget {


  VoidCallback? onpress;
  var text;
   Mybutton({super.key,this.onpress,this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Styleresorce.btncolor, //background color of button
          side: BorderSide(width:2, color:Colors.brown), //border width and color
          elevation: 3, //elevation of button
          shape: RoundedRectangleBorder( //to set border radius to button
              borderRadius: BorderRadius.circular(10)
          ),
          // padding: EdgeInsets.all(20) ,
          minimumSize: Size(300, 40),//content padding inside button
        ),
        onPressed:onpress,
        child: Text(text,style:Styleresorce.btntextstyle)
    );
  }
}
