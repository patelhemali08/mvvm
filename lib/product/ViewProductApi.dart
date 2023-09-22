import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:mvvmproject/helper/ApiHandler.dart';
import 'package:mvvmproject/helper/ErrorHandler.dart';
import 'package:mvvmproject/product/UpdateProductApi.dart';
import 'package:mvvmproject/resource/Urlresource.dart';

class ViewProductApi extends StatefulWidget {


  @override
  State<ViewProductApi> createState() => _ViewProductApiState();
}

class _ViewProductApiState extends State<ViewProductApi> {




  Future<List<dynamic>?>?alldata;
  Future<List<dynamic>?>?data()async{
  try{
    Uri uri = Uri.parse(Urlresorce.View_PRODUCT);
    var responce = await http.get(uri);
    if(responce.statusCode==200)
    {
      var body = responce.body.toString();
      print(body);
      var json = jsonDecode(body);
      return json["data"];
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("test");
    setState(() {
      alldata = data();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProductApi"),
      ),
      body:FutureBuilder(
        future: alldata,
        builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              if(snapshot.data!.length<=0)
                {
                  return Center(child: Text("NO DATA"),);
                }
              else
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.green,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("pid : "+snapshot.data![index]["pid"].toString()),
                              Text("pname : "+snapshot.data![index]["pname"].toString()),
                              Text("qty : "+snapshot.data![index]["qty"].toString()),
                              Text("price : "+snapshot.data![index]["price"].toString()),
                              Text("added_datetime : "+snapshot.data![index]["added_datetime"].toString()),

                             Row(
                               children: [
                                 SizedBox(width: 80,),
                                 IconButton(onPressed: ()async{

                                   AlertDialog alert = AlertDialog(
                                     title: Text("DELETE"),
                                     content: Text("ARE YOU SURE"),
                                     actions: [
                                       ElevatedButton(onPressed:() async {

                                         var id = snapshot.data![index]["pid"].toString();
                                         print(id);

                                         Uri uri = Uri.parse(Urlresorce.Delete_PRODUCT);
                                         var responce = await http.post(uri,body: {"pid":id});

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
                                             Navigator.of(context).pop();
                                             setState(() {
                                               alldata = data();
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
                                       }, child: Text("YES")),
                                       ElevatedButton(
                                           onPressed:(){
                                         Navigator.of(context).pop();},
                                           child: Text("NO")
                                       ),
                                     ],
                                   );
                                   showDialog(context: context, builder:(context){
                                     return alert;
                                   });
                                 },
                                   icon: Icon(Icons.delete),),
                                 SizedBox(width: 80,),
                                 IconButton(onPressed: (){

                                   var id = snapshot.data![index]["pid"].toString();
                                   print(id);

                                   Navigator.of(context).push(
                                       MaterialPageRoute(builder: (context)=>UpdateProductApi(id: id,)));

                                 }, icon: Icon(Icons.update),)
                               ],
                             )
                            ],
                          ),

                        );
                      },
                  );
                }
            }
          else
            {
              return Center(child: CircularProgressIndicator(),);
            }
        },
      ),
    );
  }
}
