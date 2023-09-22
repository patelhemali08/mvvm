import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:mvvmproject/auth/LoginPage.dart';
import 'package:mvvmproject/product/ViewProductApi.dart';
import 'package:mvvmproject/resource/StringResource.dart';
import 'package:mvvmproject/resource/Styleresorce.dart';
import 'package:mvvmproject/resource/Urlresource.dart';
import 'package:mvvmproject/widget/Mybutton.dart';
import 'package:mvvmproject/widget/Mytextfield.dart';

class RagisterPage extends StatefulWidget {


  @override
  State<RagisterPage> createState() => _RagisterPageState();
}

class _RagisterPageState extends State<RagisterPage> {

  TextEditingController _name = TextEditingController();
  TextEditingController _num = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text("RagisterPage"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 550,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ],
              tileMode: TileMode.mirror,
            ),
            color: Colors.pink,
          ),

          child: SingleChildScrollView(
            child: Container(

              color: Colors.cyan,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text(StringResource.Username,style:TextStyle(color: Colors.black87),),
                  Mytextfield(
                    controller: _name,
                    Textinputtype:TextInputType.text,
                    text: "NAME", obscureText: false,
                  ),

                  SizedBox(height: 20,),
                  Text(StringResource.number,style:TextStyle(color: Colors.black87),),
                  Mytextfield(
                    controller: _num,
                    Textinputtype:TextInputType.text,
                    text: "NUMBER",
                    obscureText: false,
                  ),
                  SizedBox(height: 20,),
                  Text(StringResource.email,style:TextStyle(color: Colors.black87),),
                  Mytextfield(
                    controller: _email,
                    text: "EMAIL",
                      Textinputtype:TextInputType.text,
                    obscureText: false,

                  ),
                  SizedBox(height: 20,),
                  Text(StringResource.password,style:TextStyle(color: Colors.black87),),
                  Mytextfield(
                      controller: _password,
                      text: "PASSWORD",
                      Textinputtype:TextInputType.text,
                    obscureText: true,
                  ),
                  SizedBox(height: 30,),
                  Mybutton(
                    text: "Register",
                    onpress:  ()async{
                      var name = _name.text.toString();
                      var number =_num.text.toString();
                      var email =_email.text.toString();
                      var password =_password.text.toString();

                      print(name);
                      print(number);
                      print(email);
                      print(password);
                      print("Value Ragister");


                    },
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                      onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Text("LoginPage",style: Styleresorce.btntextstyle,)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
