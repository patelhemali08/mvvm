import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mvvmproject/helper/ErrorHandler.dart';
import 'package:mvvmproject/modal/product.dart';
import 'package:mvvmproject/resource/Urlresource.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  late List<product>alldata;
  viewproduct(context)async{
    try{
      Uri uri = Uri.parse(Urlresorce.View_PRODUCT);
      var responce = await http.get(uri);
      if(responce.statusCode==200)
      {
        var body = responce.body.toString();
        print(body);
        var json = jsonDecode(body);
        alldata = json["data"].map<product>((data) => product.fromJson(data)).toList();
        notifyListeners();
      }
      else
      {
        print("API ERROR");
      }

    }
    on ErrorHandler catch(ex)
    {
      print("object");
      print(ex.message);

    }
  }

  addproduct()async{

  }
  deleteproduct(context)async{


  }
  updateproduct()async{

  }


}