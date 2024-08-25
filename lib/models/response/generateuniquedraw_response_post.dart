// To parse this JSON data, do
//
//     final generateuniquedrawResponsePost = generateuniquedrawResponsePostFromJson(jsonString);

import 'dart:convert';

GenerateuniquedrawResponsePost generateuniquedrawResponsePostFromJson(String str) => GenerateuniquedrawResponsePost.fromJson(json.decode(str));

String generateuniquedrawResponsePostToJson(GenerateuniquedrawResponsePost data) => json.encode(data.toJson());

class GenerateuniquedrawResponsePost {
    int rank;
    int ticketId;
    String number;

    GenerateuniquedrawResponsePost({
        required this.rank,
        required this.ticketId,
        required this.number,
    });

    factory GenerateuniquedrawResponsePost.fromJson(Map<String, dynamic> json) => GenerateuniquedrawResponsePost(
        rank: json["rank"],
        ticketId: json["ticket_id"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "rank": rank,
        "ticket_id": ticketId,
        "number": number,
    };
}
