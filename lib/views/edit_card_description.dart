import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/controllers/edit_card_description_controller.dart';

import '../controllers/user_controller.dart';

class EditCardDescription extends StatelessWidget {
  EditCardDescription({Key? key}) : super(key: key);

  final editCardDescriptionController = Get.put(EditingCardController());
  final usercontroller = Get.put(UserController());
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Padding(
                                padding:
                                EdgeInsets.only(left: 5, right: 5, top: 5),
                                child: TextFormField(
                                    controller: editCardDescriptionController
                                        .emailController,
                                    decoration: InputDecoration(
                                      // border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2.0),
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      labelText: "Email",
                                      labelStyle: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    )))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Padding(
                                padding:
                                EdgeInsets.only(left: 5, right: 5, top: 5),
                                child: TextFormField(
                                    controller: editCardDescriptionController
                                        .jobController,
                                    decoration: InputDecoration(
                                      // border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2.0),
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      labelText: "Job",
                                      labelStyle: const TextStyle(
                                        fontSize: 30,
                                      ),
                                    )))),
                        // Padding(
                        //     padding: EdgeInsets.all(10),
                        //     child: Padding(
                        //         padding:
                        //             EdgeInsets.only(left: 5, right: 5, top: 5),
                        //         child: TextFormField(
                        //             controller: editCardDescriptionController
                        //                 .priceController,
                        //             decoration: InputDecoration(
                        //               // border: InputBorder.none,
                        //               focusedBorder: OutlineInputBorder(
                        //                 borderSide: const BorderSide(
                        //                     color: Colors.black, width: 2.0),
                        //                 borderRadius: BorderRadius.circular(10.0),
                        //               ),
                        //               labelText: "Price",
                        //               labelStyle: const TextStyle(
                        //                 fontSize: 30,
                        //               ),
                        //             )))),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.green,
                                onPressed: () {
                                  usercontroller.fetchUsers2(
                                      email: editCardDescriptionController
                                          .emailController.text,
                                      job: editCardDescriptionController
                                          .jobController.text);
                                  
                                  
                                  
                                  userData.write("_isLogged", true);
                                  userData.write("userName",editCardDescriptionController.emailController.text);
                                  userData.write("job",editCardDescriptionController
                                      .jobController.text);
                                  // FocusScopeNode currentFocus = FocusScope.of(context);


                                  // int index = editCardDescriptionController.index;
                                  // editCardDescriptionController.shoppingController.products[index].productName= editCardDescriptionController.titleController.text;
                                  // editCardDescriptionController.shoppingController.products[index].productDescription= editCardDescriptionController.descriptionController.text;

                                  //Get.back();
                                  // Get.back(result: {
                                  //   "productName": EditCardDescriptionController.titleController.text,
                                  //   "productDescription": EditCardDescriptionController.descriptionController.text,
                                  //   "productPrice": EditCardDescriptionController.priceController.text,
                                  // });

                                  // Get.back(result: {
                                  //   "value": EditCardDescriptionController.priceController.text,
                                  // });
                                  FocusScope.of(context).unfocus();

                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape:  RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        18.0),
                                    side: BorderSide(color: Colors.green)),
                              ),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Text(

                              // editCardDescriptionController.userName.string + editCardDescriptionController.userJob.string,
                              // userData.read("userName")+userData.read("job"),
                               usercontroller.userInfo.value.name.toString(),
                              //     usercontroller.userInfo.value.job.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 25
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
