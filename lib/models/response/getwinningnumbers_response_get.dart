// To parse this JSON data, do
//
//     final getwinningnumbersResponseGet = getwinningnumbersResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetwinningnumbersResponseGet> getwinningnumbersResponseGetFromJson(String str) => List<GetwinningnumbersResponseGet>.from(json.decode(str).map((x) => GetwinningnumbersResponseGet.fromJson(x)));

String getwinningnumbersResponseGetToJson(List<GetwinningnumbersResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetwinningnumbersResponseGet {
    bool hasWinner;
    String number;
    int gratuity;

    GetwinningnumbersResponseGet({
        required this.hasWinner,
        required this.number,
        required this.gratuity,
    });

    factory GetwinningnumbersResponseGet.fromJson(Map<String, dynamic> json) => GetwinningnumbersResponseGet(
        hasWinner: json["HasWinner"],
        number: json["Number"],
        gratuity: json["Gratuity"],
    );

    Map<String, dynamic> toJson() => {
        "HasWinner": hasWinner,
        "Number": number,
        "Gratuity": gratuity,
    };
}
