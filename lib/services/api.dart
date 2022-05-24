import 'dart:convert';
import 'dart:developer';

import 'package:sample_project/models/user.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/user_info.dart';
class Api{


  static Future <dynamic>  PostApi({params,endpoint}) async {
    try {

      // print(email+job);


      var url = Uri.parse("https://reqres.in/api/$endpoint");
      var response =  await http.post(url, body: params);
      print("hit api");
      if(response.statusCode == 201) {

        return response.body;
        // print(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }


    static Future <dynamic>  fetchData() async {
    try {
      Response response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      print("hit api");

       if(response.statusCode == 200) {
         var jsonString = response.data as List;
         var list = <Users>[];
         print(jsonString);
         for (var element in jsonString) {
           list.add(Users.fromJson(element));
         }
         return list;
       }
    } catch (e) {
      print(e);
    }
    return [];
  }
}