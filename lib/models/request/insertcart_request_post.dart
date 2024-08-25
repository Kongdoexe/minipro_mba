// To parse this JSON data, do
//
//     final insertcartRequestGet = insertcartRequestGetFromJson(jsonString);

import 'dart:convert';

InsertcartRequestGet insertcartRequestGetFromJson(String str) => InsertcartRequestGet.fromJson(json.decode(str));

String insertcartRequestGetToJson(InsertcartRequestGet data) => json.encode(data.toJson());

class InsertcartRequestGet {
    int ticketId;
    int memberId;

    InsertcartRequestGet({
        required this.ticketId,
        required this.memberId,
    });

    factory InsertcartRequestGet.fromJson(Map<String, dynamic> json) => InsertcartRequestGet(
        ticketId: json["ticketID"],
        memberId: json["MemberID"],
    );

    Map<String, dynamic> toJson() => {
        "ticketID": ticketId,
        "MemberID": memberId,
    };
}
