// To parse this JSON data, do
//
//     final getwinningnumbersRequestGet = getwinningnumbersRequestGetFromJson(jsonString);

import 'dart:convert';

GetwinningnumbersRequestGet getwinningnumbersRequestGetFromJson(String str) => GetwinningnumbersRequestGet.fromJson(json.decode(str));

String getwinningnumbersRequestGetToJson(GetwinningnumbersRequestGet data) => json.encode(data.toJson());

class GetwinningnumbersRequestGet {
    int period;
    List<Datanum> datanum;

    GetwinningnumbersRequestGet({
        required this.period,
        required this.datanum,
    });

    factory GetwinningnumbersRequestGet.fromJson(Map<String, dynamic> json) => GetwinningnumbersRequestGet(
        period: json["period"],
        datanum: List<Datanum>.from(json["datanum"].map((x) => Datanum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "period": period,
        "datanum": List<dynamic>.from(datanum.map((x) => x.toJson())),
    };
}

class Datanum {
    String number;

    Datanum({
        required this.number,
    });

    factory Datanum.fromJson(Map<String, dynamic> json) => Datanum(
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
    };
}
