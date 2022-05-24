import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController{
  var cartItem = <Product>[].obs;

  int getItemcount()
  {
    return  cartItem.length;
  }


  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  addToCart(Product product){
    cartItem.add(product);
  }
  removeToCart(Product product){
    cartItem.remove(product);
  }


}