// To parse this JSON data, do
//
//     final getsearchnumberRequestPost = getsearchnumberRequestPostFromJson(jsonString);

import 'dart:convert';

GetsearchnumberRequestPost getsearchnumberRequestPostFromJson(String str) => GetsearchnumberRequestPost.fromJson(json.decode(str));

String getsearchnumberRequestPostToJson(GetsearchnumberRequestPost data) => json.encode(data.toJson());

class GetsearchnumberRequestPost {
    String numbers;

    GetsearchnumberRequestPost({
        required this.numbers,
    });

    factory GetsearchnumberRequestPost.fromJson(Map<String, dynamic> json) => GetsearchnumberRequestPost(
        numbers: json["numbers"],
    );

    Map<String, dynamic> toJson() => {
        "numbers": numbers,
    };
}
