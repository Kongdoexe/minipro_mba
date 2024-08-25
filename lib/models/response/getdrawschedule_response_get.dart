// To parse this JSON data, do
//
//     final getdrawscheduleResponseGet = getdrawscheduleResponseGetFromJson(jsonString);

import 'dart:convert';

List<GetdrawscheduleResponseGet> getdrawscheduleResponseGetFromJson(String str) => List<GetdrawscheduleResponseGet>.from(json.decode(str).map((x) => GetdrawscheduleResponseGet.fromJson(x)));

String getdrawscheduleResponseGetToJson(List<GetdrawscheduleResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetdrawscheduleResponseGet {
    int ticketId;
    dynamic memberId;
    String number;
    int period;
    int price;

    GetdrawscheduleResponseGet({
        required this.ticketId,
        required this.memberId,
        required this.number,
        required this.period,
        required this.price,
    });

    factory GetdrawscheduleResponseGet.fromJson(Map<String, dynamic> json) => GetdrawscheduleResponseGet(
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
