import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmproject/helper/ApiHandler.dart';
import 'package:mvvmproject/product/ViewProductApi.dart';
import 'package:mvvmproject/resource/Styleresorce.dart';
import 'package:mvvmproject/resource/Urlresource.dart';
import 'package:mvvmproject/widget/Mybutton.dart';

class InsertProductApi extends StatefulWidget {
  @override
  State<InsertProductApi> createState() => _InsertProductApiState();
}

class _InsertProductApiState extends State<InsertProductApi> {
  TextEditingController _pname = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InsertProductApi"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Styleresorce.rtecolor,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "NAME"),
                controller: _pname,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "QTY"),
                controller: _qty,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "PRICE"),
                controller: _price,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Mybutton(
                onpress: () async {
                  var name = _pname.text.toString();
                  var qty = _qty.text.toString();
                  var price = _price.text.toString();

                  Map<String, String> prams = {
                    "pname": name,
                    "qty": qty,
                    "price": price
                  };

                  await ApiHandler.post(Urlresorce.ADD_PRODUCT, body: prams)
                      .then((json) {
                    if (json["status"] == "true") {
                      print("object");
                      var msg = json["message"].toString();
                      print(msg);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewProductApi()));
                    } else {
                      var msg = json["message"].toString();
                      print(msg);
                    }
                  });


                },
                text: "SUBMIT",
              ),

            ],
          ),
        ),
      ),
    );
  }
}
