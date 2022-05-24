import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 import 'package:sample_project/models/product.dart';

class ShoppingController extends GetxController{

  var products = <Product>[].obs;

  var v = " asad".obs;

  final userData = GetStorage();



  @override
  void onInit(){
    userData.write("userName","asad iqbal");
    userData.write("job","flutter");

    super.onInit();
    fetchProduct();
  }

  void fetchProduct()async{
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    products.assignAll(serverResponse);
    // products.value = serverResponse;
  }
  
}