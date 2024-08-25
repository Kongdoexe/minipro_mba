// To parse this JSON data, do
//
//     final allErrorResponseGet = allErrorResponseGetFromJson(jsonString);

import 'dart:convert';

AllErrorResponseGet allErrorResponseGetFromJson(String str) => AllErrorResponseGet.fromJson(json.decode(str));

String allErrorResponseGetToJson(AllErrorResponseGet data) => json.encode(data.toJson());

class AllErrorResponseGet {
    String msg;

    AllErrorResponseGet({
        required this.msg,
    });

    factory AllErrorResponseGet.fromJson(Map<String, dynamic> json) => AllErrorResponseGet(
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
    };
}
