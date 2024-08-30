// To parse this JSON data, do
//
//     final getnumbersincartResponseGet = getnumbersincartResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetnumbersincartResponseGet> getnumbersincartResponseGetFromJson(String str) => List<GetnumbersincartResponseGet>.from(json.decode(str).map((x) => GetnumbersincartResponseGet.fromJson(x)));

String getnumbersincartResponseGetToJson(List<GetnumbersincartResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetnumbersincartResponseGet {
    int cartId;
    int memberId;
    String numLotto;

    GetnumbersincartResponseGet({
        required this.cartId,
        required this.memberId,
        required this.numLotto,
    });

    factory GetnumbersincartResponseGet.fromJson(Map<String, dynamic> json) => GetnumbersincartResponseGet(
        cartId: json["cart_id"],
        memberId: json["member_id"],
        numLotto: json["num_lotto"],
    );

    Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "member_id": memberId,
        "num_lotto": numLotto,
    };
}
