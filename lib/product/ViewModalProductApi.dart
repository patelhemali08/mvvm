import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmproject/helper/ErrorHandler.dart';
import 'package:mvvmproject/modal/product.dart';
import 'package:mvvmproject/product/UpdateProductApi.dart';
import 'package:mvvmproject/provider/ProductProvider.dart';
import 'package:mvvmproject/resource/Urlresource.dart';
import 'package:provider/provider.dart';

class ViewModalProductApi extends StatefulWidget {
  const ViewModalProductApi({super.key});

  @override
  State<ViewModalProductApi> createState() => _ViewModalProductApiState();
}

class _ViewModalProductApiState extends State<ViewModalProductApi> {

  ProductProvider? provider;

  data()async{
      await provider!.viewproduct(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    print("test");
    data();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewModalProductApi"),
      ),
      body:ListView.builder(
        itemCount: provider!.alldata.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.green,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("pid : "+provider!.alldata[index].pid.toString()),
                Text("pname : "+provider!.alldata[index].pname.toString()),
                Text("qty : "+provider!.alldata[index].qty.toString()),
                Text("price : "+provider!.alldata[index].price.toString()),
                Text("added_datetime : "+provider!.alldata[index].addedDatetime.toString()),

                Row(
                  children: [
                    SizedBox(width: 80,),
                    IconButton(onPressed: ()async{

                      AlertDialog alert = AlertDialog(
                        title: Text("DELETE"),
                        content: Text("ARE YOU SURE"),
                        actions: [
                          ElevatedButton(onPressed:() async {

                            var id = provider!.alldata[index].pid.toString();
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
                                  data();
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

                      var id = provider!.alldata[index].pid.toString();
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
      ),
    );
  }
}
