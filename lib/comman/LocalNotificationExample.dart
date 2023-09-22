import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class LocalNotificationExample extends StatefulWidget {
  const LocalNotificationExample({super.key});

  @override
  State<LocalNotificationExample> createState() => _LocalNotificationExampleState();
}

class _LocalNotificationExampleState extends State<LocalNotificationExample> {
  @override

  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: Text('Allow Notifications'),
                  content: Text('Our app would like to send you notifications'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Don\'t Allow',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          AwesomeNotifications()
                              .requestPermissionToSendNotifications()
                              .then((_) => Navigator.pop(context)),
                      child: Text(
                        'Allow',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
          );

        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocalNotificationExample"),
      ),
      body: Center(
         child: ElevatedButton(
           onPressed: () async {
             await AwesomeNotifications().createNotification(

               content: NotificationContent(
                 id: 12345,
                 channelKey: 'basic_channel',
                 title:
                 '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
                 body: 'Florist at 123 Main St. has 2 in stock.',
                 bigPicture:'asset://img/bycicle.png',

                 notificationLayout: NotificationLayout.BigPicture,
               ),
               actionButtons: [

                 NotificationActionButton(
                   key: 'button1',
                   label: 'Button 1',
                 ),
                 NotificationActionButton(
                   key: 'button2',
                   label: 'Button 2',
                 ),
               ],
             );

           },
           child: Text("SUBMIT"),
         ),
      ),
    );
  }
}
