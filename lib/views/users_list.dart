import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sample_project/controllers/user_controller.dart';


class UsersList extends StatelessWidget {
  UsersList({Key? key}) : super(key: key);

  final Usercontroller = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.only(),
            child: ListView.separated(
                itemCount: Usercontroller.usersList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction){

                    },
                    direction: DismissDirection.endToStart,
                    child: Container(
                      // margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("Title: ${Usercontroller.usersList[index].title}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text("Description: ${Usercontroller.usersList[index].title}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },separatorBuilder: (BuildContext context, int index) {
                  return  const SizedBox(
                    height: 10,
                  );
            },
            ),
          );
        })
    );
  }
}




