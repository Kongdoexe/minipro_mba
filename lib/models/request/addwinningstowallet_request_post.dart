// To parse this JSON data, do
//
//     final addwinningstowalletRequestPost = addwinningstowalletRequestPostFromJson(jsonString);

import 'dart:convert';

AddwinningstowalletRequestPost addwinningstowalletRequestPostFromJson(String str) => AddwinningstowalletRequestPost.fromJson(json.decode(str));

String addwinningstowalletRequestPostToJson(AddwinningstowalletRequestPost data) => json.encode(data.toJson());

class AddwinningstowalletRequestPost {
    int id;
    List<Datum> data;

    AddwinningstowalletRequestPost({
        required this.id,
        required this.data,
    });

    factory AddwinningstowalletRequestPost.fromJson(Map<String, dynamic> json) => AddwinningstowalletRequestPost(
        id: json["id"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    bool hasWinner;
    String number;
    int rank;
    int gratuity;
    int period;

    Datum({
        required this.hasWinner,
        required this.number,
        required this.rank,
        required this.gratuity,
        required this.period,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
