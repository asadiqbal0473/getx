import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/controllers/shopping_controller.dart';

import '../models/product.dart';

class EditingCardController extends GetxController{

  var argumentData = Get.arguments;
  // final userData = GetStorage();

  var userName = "".obs;
  var userJob = "".obs ;

  final shoppingController = Get.find<ShoppingController>();
  String productTitle = "";
  String productDescription = "";
  double productPrice=0.0;
  int index= 0;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void onInit(){

    print("Edit");
    String value;
   value =  shoppingController.userData.read("userName");
     userName.value = value;

   // print(userName);
   // userJob = shoppingController.userData.read("job");




    super.onInit();

    // index = argumentData[0]['index'];
    // titleController.text = shoppingController.products[index].productName;
    // descriptionController.text = shoppingController.products[index].productDescription;
    // priceController.text = shoppingController.products[index].price.toString();




    // print(argumentData[0]['index']);
    //
    //
    //  print(index);
    //
    //
    // productTitle = shoppingController.products[index].productName;
    // print(productTitle);

    // productTitle  = argumentData[0]["productName"];
    // // print("sssss $productTitle");
    // titleController.text = productTitle;
    // productDescription  = argumentData[1]["productDescription"];
    // descriptionController.text = productDescription;
    // productPrice  = argumentData[2]["productPrice"];
    // priceController.text =  productPrice.toString();
  }




}