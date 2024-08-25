// To parse this JSON data, do
//
//     final regsiterRequestPost = regsiterRequestPostFromJson(jsonString);

import 'dart:convert';

RegsiterRequestPost regsiterRequestPostFromJson(String str) => RegsiterRequestPost.fromJson(json.decode(str));

String regsiterRequestPostToJson(RegsiterRequestPost data) => json.encode(data.toJson());

class RegsiterRequestPost {
    String name;
    String email;
    String password;
    int phone;
    int wallet;
    int isadmin;

    RegsiterRequestPost({
        required this.name,
        required this.email,
        required this.password,
        required this.phone,
        required this.wallet,
        required this.isadmin,
    });

    factory RegsiterRequestPost.fromJson(Map<String, dynamic> json) => RegsiterRequestPost(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        wallet: json["wallet"],
        isadmin: json["isadmin"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "wallet": wallet,
        "isadmin": isadmin,
    };
}
