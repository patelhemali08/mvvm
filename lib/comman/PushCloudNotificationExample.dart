import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushCloudNotificationExample extends StatefulWidget {
  const PushCloudNotificationExample({super.key});

  @override
  State<PushCloudNotificationExample> createState() => _PushCloudNotificationExampleState();
}

class _PushCloudNotificationExampleState extends State<PushCloudNotificationExample> {
  var token ="";

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print(token);
      token = prefs.getString("token").toString();
      print(token);
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PushCloudNotificationExample"),
      ),
      body: Center(
        child: Text(token),
      ),
    );
  }
}
