// To parse this JSON data, do
//
//     final getprizeResponseGet = getprizeResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetprizeResponseGet> getprizeResponseGetFromJson(String str) => List<GetprizeResponseGet>.from(json.decode(str).map((x) => GetprizeResponseGet.fromJson(x)));

String getprizeResponseGetToJson(List<GetprizeResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetprizeResponseGet {
    int period;
    List<Result> results;

    GetprizeResponseGet({
        required this.period,
        required this.results,
    });

    factory GetprizeResponseGet.fromJson(Map<String, dynamic> json) => GetprizeResponseGet(
        period: json["Period"],
        results: List<Result>.from(json["Results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Period": period,
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    int winnerId;
    int rank;
    String number;
    dynamic memberId;
    int gratuity;

    Result({
        required this.winnerId,
        required this.rank,
        required this.number,
        required this.memberId,
        required this.gratuity,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
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