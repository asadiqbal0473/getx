import 'package:flutter/material.dart';
import 'package:sample_project/services/notification.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({Key? key}) : super(key: key);

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Local Notication",
        ),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              child:  Row(
                children:const [
                  Icon(
                    Icons.notification_important,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Simple Notification',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              onPressed: () {
                 NotificationApi.showNotification(
                   id: 0,
                   title: "asad",
                   body: "hello world",
                   payload:"asd",
                 );

              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
