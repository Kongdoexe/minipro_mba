// To parse this JSON data, do
//
//     final loginRequestGet = loginRequestGetFromJson(jsonString);

import 'dart:convert';

LoginRequestGet loginRequestGetFromJson(String str) => LoginRequestGet.fromJson(json.decode(str));

String loginRequestGetToJson(LoginRequestGet data) => json.encode(data.toJson());

class LoginRequestGet {
    String email;
    String password;

    LoginRequestGet({
        required this.email,
        required this.password,
    });

    factory LoginRequestGet.fromJson(Map<String, dynamic> json) => LoginRequestGet(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
