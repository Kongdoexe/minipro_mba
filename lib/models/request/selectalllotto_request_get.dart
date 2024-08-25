// To parse this JSON data, do
//
//     final selectalllottoRequestGet = selectalllottoRequestGetFromJson(jsonString);

import 'dart:convert';

SelectalllottoRequestGet selectalllottoRequestGetFromJson(String str) => SelectalllottoRequestGet.fromJson(json.decode(str));

String selectalllottoRequestGetToJson(SelectalllottoRequestGet data) => json.encode(data.toJson());

class SelectalllottoRequestGet {
    bool status;

    SelectalllottoRequestGet({
        required this.status,
    });

    factory SelectalllottoRequestGet.fromJson(Map<String, dynamic> json) => SelectalllottoRequestGet(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
