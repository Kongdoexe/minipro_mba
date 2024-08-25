// To parse this JSON data, do
//
//     final selectalllottoResponseGet = selectalllottoResponseGetFromJson(jsonString);

import 'dart:convert';

List<SelectalllottoResponseGet> selectalllottoResponseGetFromJson(String str) => List<SelectalllottoResponseGet>.from(json.decode(str).map((x) => SelectalllottoResponseGet.fromJson(x)));

String selectalllottoResponseGetToJson(List<SelectalllottoResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectalllottoResponseGet {
    int ticketId;
    dynamic memberId;
    String number;
    int period;
    int price;

    SelectalllottoResponseGet({
        required this.ticketId,
        required this.memberId,
        required this.number,
        required this.period,
        required this.price,
    });

    factory SelectalllottoResponseGet.fromJson(Map<String, dynamic> json) => SelectalllottoResponseGet(
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
