import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationApi{

static final _notications = FlutterLocalNotificationsPlugin();


static Future _noticationDetails()async{
  return const NotificationDetails(
    android: AndroidNotificationDetails("chanel id","channel Name",
    importance: Importance.max,
    ),
  );
}





static Future? showNotification ({int id = 0,String?title,String?body,String? payload}) async {

   await _notications.show(id, title, body, await _noticationDetails(),payload:payload);

}


}