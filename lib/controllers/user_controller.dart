
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_project/models/user.dart';
import 'package:sample_project/models/user_info.dart';
import 'package:sample_project/services/api.dart';

class UserController extends GetxController{

  var usersList = <Users>[].obs;

  var  userInfo = UserInfo().obs;


  @override
  void onInit(){

    super.onInit();
    fetchUsers();
  }

  void fetchUsers2({ required String email, required String job})async{

    // print(email+job);

    // userInfo.obs;
    var params={'name':email,'job':job};
    var response = await Api.PostApi(endpoint: 'users',params: params);

      // print(response);

      if(response!=null)
        {
          var jsonString = jsonDecode(response);
          print(jsonString);
           var a= UserInfo.fromJson(jsonString);
          userInfo.value = a;
          print("${a.id} ${a.job}");
        }else{
        print('something went wrong....');
      }



  }
  void fetchUsers()async{

    var users = await Api.fetchData();
    if(users!=null)
      {

        usersList.value = users;
      }
  }


}