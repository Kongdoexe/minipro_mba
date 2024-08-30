// To parse this JSON data, do
//
//     final getwinningnumbersRequestGet = getwinningnumbersRequestGetFromJson(jsonString);

import 'dart:convert';

List<GetwinningnumbersRequestGet> getwinningnumbersRequestGetFromJson(String str) => List<GetwinningnumbersRequestGet>.from(json.decode(str).map((x) => GetwinningnumbersRequestGet.fromJson(x)));

String getwinningnumbersRequestGetToJson(List<GetwinningnumbersRequestGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetwinningnumbersRequestGet {
    String number;

    GetwinningnumbersRequestGet({
        required this.number,
    });

    factory GetwinningnumbersRequestGet.fromJson(Map<String, dynamic> json) => GetwinningnumbersRequestGet(
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
    };
}
