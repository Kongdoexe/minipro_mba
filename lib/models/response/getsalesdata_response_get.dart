// To parse this JSON data, do
//
//     final getsalesdataResponseGet = getsalesdataResponseGetFromJson(jsonString);

import 'dart:convert';

GetsalesdataResponseGet getsalesdataResponseGetFromJson(String str) => GetsalesdataResponseGet.fromJson(json.decode(str));

String getsalesdataResponseGetToJson(GetsalesdataResponseGet data) => json.encode(data.toJson());

class GetsalesdataResponseGet {
    int remainingNumbersCount;
    int salesSummary;
    int soldNumbersCount;

    GetsalesdataResponseGet({
        required this.remainingNumbersCount,
        required this.salesSummary,
        required this.soldNumbersCount,
    });

    factory GetsalesdataResponseGet.fromJson(Map<String, dynamic> json) => GetsalesdataResponseGet(
        remainingNumbersCount: json["remainingNumbersCount"],
        salesSummary: json["salesSummary"],
        soldNumbersCount: json["soldNumbersCount"],
    );

    Map<String, dynamic> toJson() => {
        "remainingNumbersCount": remainingNumbersCount,
        "salesSummary": salesSummary,
        "soldNumbersCount": soldNumbersCount,
    };
}
