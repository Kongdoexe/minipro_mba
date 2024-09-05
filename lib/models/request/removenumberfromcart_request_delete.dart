// To parse this JSON data, do
//
//     final removenumberfromcartRequestDelete = removenumberfromcartRequestDeleteFromJson(jsonString);

import 'dart:convert';

RemovenumberfromcartRequestDelete removenumberfromcartRequestDeleteFromJson(String str) => RemovenumberfromcartRequestDelete.fromJson(json.decode(str));

String removenumberfromcartRequestDeleteToJson(RemovenumberfromcartRequestDelete data) => json.encode(data.toJson());

class RemovenumberfromcartRequestDelete {
    int cartId;
    int memberId;

    RemovenumberfromcartRequestDelete({
        required this.cartId,
        required this.memberId,
    });

    factory RemovenumberfromcartRequestDelete.fromJson(Map<String, dynamic> json) => RemovenumberfromcartRequestDelete(
        cartId: json["cartID"],
        memberId: json["memberID"],
    );

    Map<String, dynamic> toJson() => {
        "cartID": cartId,
        "memberID": memberId,
    };
}