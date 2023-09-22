import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mvvmproject/comman/HomePage.dart';
import 'package:mvvmproject/firebase_options.dart';
import 'package:mvvmproject/product/InsertProductApi.dart';
import 'package:mvvmproject/auth/LoginPage.dart';
import 'package:mvvmproject/auth/RagisterPage.dart';
import 'package:mvvmproject/product/UpdateProductApi.dart';
import 'package:mvvmproject/product/ViewProductApi.dart';
import 'package:mvvmproject/provider/ProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().initialize(
    'resource://drawable/bus',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  FirebaseMessaging.instance.getToken().then((token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString("token", token!);
    
  });


  FirebaseMessaging.onMessage.listen(showFlutterNotification);
  runApp(MyApp());
}
void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 123,
      channelKey: 'basic_channel',
      title: notification?.title,
      body: notification?.body,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        // ChangeNotifierProvider(create: (context)=>EmployeeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}


