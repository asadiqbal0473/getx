// class Users {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;
//   Users({this.userId, this.id, this.title, this.body});
//
//   Users.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['body'] = this.body;
//     return data;
//   }
// }
import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int ?id;
  String ?title;
  String ?body;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
