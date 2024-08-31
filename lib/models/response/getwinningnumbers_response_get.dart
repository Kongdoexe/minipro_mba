// To parse this JSON data, do
//
//     final getwinningnumbersResponseGet = getwinningnumbersResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetwinningnumbersResponseGet> getwinningnumbersResponseGetFromJson(String str) => List<GetwinningnumbersResponseGet>.from(json.decode(str).map((x) => GetwinningnumbersResponseGet.fromJson(x)));

String getwinningnumbersResponseGetToJson(List<GetwinningnumbersResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetwinningnumbersResponseGet {
    bool hasWinner;
    String number;
    int rank;
    int gratuity;
    int period;

    GetwinningnumbersResponseGet({
        required this.hasWinner,
        required this.number,
        required this.rank,
        required this.gratuity,
        required this.period,
    });

    factory GetwinningnumbersResponseGet.fromJson(Map<String, dynamic> json) => GetwinningnumbersResponseGet(
        hasWinner: json["HasWinner"],
        number: json["Number"],
        rank: json["Rank"],
        gratuity: json["Gratuity"],
        period: json["Period"],
    );

    Map<String, dynamic> toJson() => {
        "HasWinner": hasWinner,
        "Number": number,
        "Rank": rank,
        "Gratuity": gratuity,
        "Period": period,
    };
}
