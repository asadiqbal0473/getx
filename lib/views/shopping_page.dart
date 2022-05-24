import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sample_project/controllers/shopping_controller.dart';
import 'package:sample_project/views/edit_card_description.dart';

import '../controllers/cart_controller.dart';

// Get.to(() => SecondScreen(), arguments: [
// {"first": 'First data'},
// {"second": 'Second data'}
// ]);

class ShoppingPage extends StatelessWidget {

  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController =  Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  int index_ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                // child: Obx((){
                //   return ListView.builder(
                //       itemCount: shoppingController.products.length,
                //       itemBuilder: (context,index) {
                //         index_ = index;
                //         return Card(
                //           margin: const EdgeInsets.all(12),
                //           child: Padding(
                //             padding: const EdgeInsets.all(16.0),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.end,
                //               children: [
                //                 InkWell(
                //                   onTap:()async{
                //                     var arg = await Get.to(() => EditCardDescription(), arguments: [
                //                       {"productName": shoppingController.products[index].productName},
                //                       {"productDescription": shoppingController.products[index].productDescription},
                //                       {"productPrice": shoppingController.products[index].price}
                //                     ]);
                //                     print('>>>>>> $arg');
                //                     shoppingController.products[index].productName = arg['productName'];
                //                     // shoppingController.update();
                //                     print(shoppingController.products[index].productName);
                //                     // shoppingController.products[index].productDescription = arg["productDescription"];
                //                     // shoppingController.products[index].price = arg["productPrice"];
                //                   },
                //                   child: Row(
                //                     mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       Column(
                //                         crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             '${shoppingController.products[index].productName}',
                //                             style: TextStyle(fontSize: 24),
                //                           ),
                //                           Text(
                //                               '${shoppingController.products[index].productDescription}'),
                //                         ],
                //                       ),
                //                       Text('\$${shoppingController.products[index].price}',
                //                           style: TextStyle(fontSize: 24)),
                //                     ],
                //                   ),
                //                 ),
                //                 RaisedButton(
                //                   onPressed: () {
                //                     cartController.addToCart(shoppingController.products[index]);
                //                   },
                //                   color: Colors.blue,
                //                   textColor: Colors.white,
                //                   child: Text('Add to Cart'),
                //                 ),
                //                 ElevatedButton(
                //                   child: const Text('Remove Item'),
                //                   onPressed: () {
                //                     cartController.removeToCart(shoppingController.products[index]);
                //                   },
                //                   style: ElevatedButton.styleFrom(
                //                       primary: Colors.red,
                //                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                //                       textStyle: const TextStyle(
                //                           fontSize: 15,
                //                           fontWeight: FontWeight.bold)),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         );
                //
                //       });
                // }),
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        index_ = index;
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // var arg = await Get.to(() => EditCardDescription(), arguments: [
                                    //      {"productName": controller.products[index].productName},
                                    //      {"productDescription": controller.products[index].productDescription},
                                    //      {
                                    //        "productPrice": controller.products[index].price
                                    //      }
                                    //    ]);
                                    // print('>>>>>> $arg');
                                    // controller.products[index].productName = arg['productName'];
                                    //  print(controller.products[index].productName);
                                    // controller.products[index].productDescription = arg["productDescription"];
                                    // controller.products.refresh();

                                    var arg = await Get.to(
                                        () => EditCardDescription(),
                                        arguments: [
                                          {"index": index},
                                        ]);
                                    controller.products.refresh();
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${controller.products[index].productName}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Text(
                                              '${controller.products[index].productDescription}'),
                                        ],
                                      ),
                                      Text(
                                          '\$${controller.products[index].price}',
                                          style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text('Add to Cart'),
                                ),
                                ElevatedButton(
                                  child: const Text('Remove Item'),
                                  onPressed: () {
                                    cartController.removeToCart(
                                        controller.products[index]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 10),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 20,
              ),

              Obx((){
                return InkWell(
                  onTap: ()async{
                    var arg = await Get.to(() => EditCardDescription(), arguments: [
                      {"value":shoppingController.v.value},
                    ]);
                    // print('>>>>>> $arg');
                    shoppingController.v.value = arg['value'];
                    print(" varaibel : ${shoppingController.v.value}");

                  },
                  child: Text(
                      shoppingController.v.value
                  ),
                );
              }),

              GetX<CartController>(builder: (controller) {
                return Text(
                  'Total amount: \$ ${controller.totalPrice}',
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child:Row(
                        children:  [
                         const Icon(
                            Icons.add_shopping_cart,
                             color: Colors.black,
                          ),
                         const SizedBox(
                            width: 10,
                          ),

                           GetX<CartController>(
                             builder: (Controller) {
                               return Text(
                                  Controller.getItemcount().toString(),
                                 style: const TextStyle(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black
                                 ),

                          );
                             }
                           ),
                        ],
                      ),
                      style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                       (Set<MaterialState> states) {
                         return EdgeInsets.all(12);
                         }),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )
                          )
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
