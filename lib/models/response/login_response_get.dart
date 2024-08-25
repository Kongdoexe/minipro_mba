// To parse this JSON data, do
//
//     final loginResponseGet = loginResponseGetFromJson(jsonString);

import 'dart:convert';

LoginResponseGet loginResponseGetFromJson(String str) => LoginResponseGet.fromJson(json.decode(str));

String loginResponseGetToJson(LoginResponseGet data) => json.encode(data.toJson());

class LoginResponseGet {
    int memberId;
    String name;
    String email;
    String password;
    int phone;
    int wallet;
    int isadmin;

    LoginResponseGet({
        required this.memberId,
        required this.name,
        required this.email,
        required this.password,
        required this.phone,
        required this.wallet,
        required this.isadmin,
    });

    factory LoginResponseGet.fromJson(Map<String, dynamic> json) => LoginResponseGet(
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
