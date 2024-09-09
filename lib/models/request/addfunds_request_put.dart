// To parse this JSON data, do
//
//     final addfundsRequestPut = addfundsRequestPutFromJson(jsonString);

import 'dart:convert';

AddfundsRequestPut addfundsRequestPutFromJson(String str) => AddfundsRequestPut.fromJson(json.decode(str));

String addfundsRequestPutToJson(AddfundsRequestPut data) => json.encode(data.toJson());

class AddfundsRequestPut {
    int gratuity;

    AddfundsRequestPut({
        required this.gratuity,
    });

    factory AddfundsRequestPut.fromJson(Map<String, dynamic> json) => AddfundsRequestPut(
        gratuity: json["gratuity"],
    );

    Map<String, dynamic> toJson() => {
        "gratuity": gratuity,
    };
}
