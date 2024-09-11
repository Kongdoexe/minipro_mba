// To parse this JSON data, do
//
//     final getprizeResponseGet = getprizeResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetprizeResponseGet> getprizeResponseGetFromJson(String str) => List<GetprizeResponseGet>.from(json.decode(str).map((x) => GetprizeResponseGet.fromJson(x)));

String getprizeResponseGetToJson(List<GetprizeResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetprizeResponseGet {
    int winnerId;
    int rank;
    String number;
    dynamic memberId;
    int gratuity;

    GetprizeResponseGet({
        required this.winnerId,
        required this.rank,
        required this.number,
        required this.memberId,
        required this.gratuity,
    });

    factory GetprizeResponseGet.fromJson(Map<String, dynamic> json) => GetprizeResponseGet(
        winnerId: json["WinnerID"],
        rank: json["Rank"],
        number: json["Number"],
        memberId: json["MemberID"],
        gratuity: json["Gratuity"],
    );

    Map<String, dynamic> toJson() => {
        "WinnerID": winnerId,
        "Rank": rank,
        "Number": number,
        "MemberID": memberId,
        "Gratuity": gratuity,
    };
}
