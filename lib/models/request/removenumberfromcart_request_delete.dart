// To parse this JSON data, do
//
//     final removenumberfromcartRequestDelete = removenumberfromcartRequestDeleteFromJson(jsonString);

import 'dart:convert';

RemovenumberfromcartRequestDelete removenumberfromcartRequestDeleteFromJson(String str) => RemovenumberfromcartRequestDelete.fromJson(json.decode(str));

String removenumberfromcartRequestDeleteToJson(RemovenumberfromcartRequestDelete data) => json.encode(data.toJson());

class RemovenumberfromcartRequestDelete {
    int ticketId;
    int memberId;

    RemovenumberfromcartRequestDelete({
        required this.ticketId,
        required this.memberId,
    });

    factory RemovenumberfromcartRequestDelete.fromJson(Map<String, dynamic> json) => RemovenumberfromcartRequestDelete(
        ticketId: json["ticketID"],
        memberId: json["MemberID"],
    );

    Map<String, dynamic> toJson() => {
        "ticketID": ticketId,
        "MemberID": memberId,
    };
}
