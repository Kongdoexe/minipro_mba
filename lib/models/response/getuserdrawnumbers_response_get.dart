// To parse this JSON data, do
//
//     final getuserdrawnumbersResponseGet = getuserdrawnumbersResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetuserdrawnumbersResponseGet> getuserdrawnumbersResponseGetFromJson(String str) => List<GetuserdrawnumbersResponseGet>.from(json.decode(str).map((x) => GetuserdrawnumbersResponseGet.fromJson(x)));

String getuserdrawnumbersResponseGetToJson(List<GetuserdrawnumbersResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetuserdrawnumbersResponseGet {
    int ticketId;
    int memberId;
    String number;
    int period;
    int price;

    GetuserdrawnumbersResponseGet({
        required this.ticketId,
        required this.memberId,
        required this.number,
        required this.period,
        required this.price,
    });

    factory GetuserdrawnumbersResponseGet.fromJson(Map<String, dynamic> json) => GetuserdrawnumbersResponseGet(
        ticketId: json["TicketID"],
        memberId: json["memberID"],
        number: json["number"],
        period: json["period"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "TicketID": ticketId,
        "memberID": memberId,
        "number": number,
        "period": period,
        "price": price,
    };
}
