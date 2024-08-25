// To parse this JSON data, do
//
//     final getwinningnumbersRequestGet = getwinningnumbersRequestGetFromJson(jsonString);

import 'dart:convert';

List<GetwinningnumbersRequestGet> getwinningnumbersRequestGetFromJson(String str) => List<GetwinningnumbersRequestGet>.from(json.decode(str).map((x) => GetwinningnumbersRequestGet.fromJson(x)));

String getwinningnumbersRequestGetToJson(List<GetwinningnumbersRequestGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetwinningnumbersRequestGet {
    String number;
    int period;

    GetwinningnumbersRequestGet({
        required this.number,
        required this.period,
    });

    factory GetwinningnumbersRequestGet.fromJson(Map<String, dynamic> json) => GetwinningnumbersRequestGet(
        number: json["number"],
        period: json["period"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "period": period,
    };
}
