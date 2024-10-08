// To parse this JSON data, do
//
//     final regsiterResponsePost = regsiterResponsePostFromJson(jsonString);

import 'dart:convert';

RegsiterResponsePost regsiterResponsePostFromJson(String str) => RegsiterResponsePost.fromJson(json.decode(str));

String regsiterResponsePostToJson(RegsiterResponsePost data) => json.encode(data.toJson());

class RegsiterResponsePost {
    int memberId;
    String name;
    String email;
    String password;
    int phone;
    int wallet;
    int isadmin;

    RegsiterResponsePost({
        required this.memberId,
        required this.name,
        required this.email,
        required this.password,
        required this.phone,
        required this.wallet,
        required this.isadmin,
    });

    factory RegsiterResponsePost.fromJson(Map<String, dynamic> json) => RegsiterResponsePost(
        memberId: json["MemberID"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        wallet: json["wallet"],
        isadmin: json["isadmin"],
    );

    Map<String, dynamic> toJson() => {
        "MemberID": memberId,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "wallet": wallet,
        "isadmin": isadmin,
    };
}
