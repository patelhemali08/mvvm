import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmproject/product/ViewProductApi.dart';
import 'package:mvvmproject/resource/Styleresorce.dart';
import 'package:mvvmproject/resource/Urlresource.dart';

class UpdateProductApi extends StatefulWidget {
var id;
  UpdateProductApi({this.id});


  @override
  State<UpdateProductApi> createState() => _UpdateProductApiState();
}

class _UpdateProductApiState extends State<UpdateProductApi> {

  TextEditingController _pname = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();


  
  getdata()async{
    Uri uri = Uri.parse(Urlresorce.getSingle_PRODUCT);
    print("id :"+widget.id);
    var responce = await http.post(uri,body: {"pid":widget.id});
    if(responce.statusCode==200)
      {
        var body = responce.body.toString();
        print(body);
         var json = jsonDecode(body);
        print("jason:" + json.toString());
         if(json["status"]=="true")

           {
             print("object");
             setState(() {
               _pname.text = json["data"]["pname"].toString();
               _qty.text = json["data"]["qty"].toString();
               _price.text = json["data"]["price"].toString();
             });
           }
         else
           {
             var msg = json["message"].toString();
             Fluttertoast.showToast(
                 msg: msg ,
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.CENTER,
                 timeInSecForIosWeb: 1,
                 backgroundColor: Colors.red,
                 textColor: Colors.white,
                 fontSize: 16.0
             );
           }
      }
    else
      {
        print("API ERROR");
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpdateProductApi"),
      ),
      body:SingleChildScrollView(
        child: Container(
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
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "QTY"),
                controller: _qty,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "PRICE"),
                controller: _price,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),

              ElevatedButton(

                  onPressed: ()async{

                    var name = _pname.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();


                    Uri uri = Uri.parse(Urlresorce.Update_PRODUCT);
                    print("uri :${uri}");
                    var responce = await http.post(uri,body: {
                      "pname":name,
                      "qty":qty,
                      "price":price,
                      "pid":widget.id
                    });

                    if(responce.statusCode==200)
                    {
                      var body = responce.body.toString();
                      print(body);

                      var json = jsonDecode(body);
                      if(json["status"]=="true")
                      {
                        var msg = json["message"].toString();
                        Fluttertoast.showToast(
                            msg: msg ,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewProductApi()));

                      }
                      else
                      {
                        var msg = json["message"].toString();
                        Fluttertoast.showToast(
                            msg: msg ,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                    else
                    {
                      print("API ERROR");
                    }

                  },
                  child: Text("SUBMIT")
              )
            ],
          ),
        ),
      ),
    );
  }
}
