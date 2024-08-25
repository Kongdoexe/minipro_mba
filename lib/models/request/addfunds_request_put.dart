// To parse this JSON data, do
//
//     final addfundsRequestPut = addfundsRequestPutFromJson(jsonString);

import 'dart:convert';

AddfundsRequestPut addfundsRequestPutFromJson(String str) => AddfundsRequestPut.fromJson(json.decode(str));

String addfundsRequestPutToJson(AddfundsRequestPut data) => json.encode(data.toJson());

class AddfundsRequestPut {
    int cash;

    AddfundsRequestPut({
        required this.cash,
    });

    factory AddfundsRequestPut.fromJson(Map<String, dynamic> json) => AddfundsRequestPut(
        cash: json["cash"],
    );

    Map<String, dynamic> toJson() => {
        "cash": cash,
    };
}
