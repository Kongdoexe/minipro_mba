// To parse this JSON data, do
//
//     final updateprofileRequestGet = updateprofileRequestGetFromJson(jsonString);

import 'dart:convert';

UpdateprofileRequestGet updateprofileRequestGetFromJson(String str) => UpdateprofileRequestGet.fromJson(json.decode(str));

String updateprofileRequestGetToJson(UpdateprofileRequestGet data) => json.encode(data.toJson());

class UpdateprofileRequestGet {
    String name;
    String email;
    int phone;

    UpdateprofileRequestGet({
        required this.name,
        required this.email,
        required this.phone,
    });

    factory UpdateprofileRequestGet.fromJson(Map<String, dynamic> json) => UpdateprofileRequestGet(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
    };
}
