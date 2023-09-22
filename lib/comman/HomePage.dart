import 'package:flutter/material.dart';
import 'package:mvvmproject/comman/GoggleMapLocation.dart';
import 'package:mvvmproject/comman/LocalNotificationExample.dart';
import 'package:mvvmproject/comman/MapImagemarker.dart';
import 'package:mvvmproject/comman/Multiplemarkers.dart';
import 'package:mvvmproject/comman/PushCloudNotificationExample.dart';
import 'package:mvvmproject/product/InsertProductApi.dart';
import 'package:mvvmproject/auth/LoginPage.dart';
import 'package:mvvmproject/auth/RagisterPage.dart';
import 'package:mvvmproject/product/UpdateProductApi.dart';
import 'package:mvvmproject/product/ViewModalProductApi.dart';
import 'package:mvvmproject/product/ViewProductApi.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
    ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("RagisterPage"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RagisterPage()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("InsertProductApi"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsertProductApi()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("ViewProductApi"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewProductApi()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("ViewModalProductApi"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewModalProductApi()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("UpdateProductApi"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateProductApi()));
              },
            ),
            Divider(color: Colors.black,),

            ListTile(
              title: Text("GoggleMapLocation"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GoggleMapLocation()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("MapImageMarker"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapImagemarker()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("Multiplemarkers"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Multiplemarkers()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("LocalNotificationExample"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocalNotificationExample()));
              },
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("PushCloudNotificationExample"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PushCloudNotificationExample()));
              },
            ),
            Divider(color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
