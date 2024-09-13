// To parse this JSON data, do
//
//     final generatemultipledrawsResponseGet = generatemultipledrawsResponseGetFromJson(jsonString);

import 'dart:convert';

List<GeneratemultipledrawsResponseGet> generatemultipledrawsResponseGetFromJson(String str) => List<GeneratemultipledrawsResponseGet>.from(json.decode(str).map((x) => GeneratemultipledrawsResponseGet.fromJson(x)));

String generatemultipledrawsResponseGetToJson(List<GeneratemultipledrawsResponseGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeneratemultipledrawsResponseGet {
    int rank;
    int ticketId;
    String number;

    GeneratemultipledrawsResponseGet({
        required this.rank,
        required this.ticketId,
        required this.number,
    });

    factory GeneratemultipledrawsResponseGet.fromJson(Map<String, dynamic> json) => GeneratemultipledrawsResponseGet(
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
