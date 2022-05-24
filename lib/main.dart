import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/controllers/shopping_controller.dart';
import 'package:sample_project/views/edit_card_description.dart';
import 'package:sample_project/views/push_notification.dart';
import 'package:sample_project/views/shopping_page.dart';
import 'package:sample_project/views/users_list.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: PushNotification(),
    );
  }
}

