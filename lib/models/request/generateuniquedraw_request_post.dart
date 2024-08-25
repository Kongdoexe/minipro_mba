// To parse this JSON data, do
//
//     final generateuniquedrawRequestPost = generateuniquedrawRequestPostFromJson(jsonString);

import 'dart:convert';

GenerateuniquedrawRequestPost generateuniquedrawRequestPostFromJson(String str) => GenerateuniquedrawRequestPost.fromJson(json.decode(str));

String generateuniquedrawRequestPostToJson(GenerateuniquedrawRequestPost data) => json.encode(data.toJson());

class GenerateuniquedrawRequestPost {
    int rank;
    bool status;

    GenerateuniquedrawRequestPost({
        required this.rank,
        required this.status,
    });

    factory GenerateuniquedrawRequestPost.fromJson(Map<String, dynamic> json) => GenerateuniquedrawRequestPost(
        rank: json["rank"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "rank": rank,
        "status": status,
    };
}
