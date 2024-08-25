import 'dart:convert';

ProcesspayErrorResponse processpayerrorResponseFromJson(String str) =>
    ProcesspayErrorResponse.fromJson(json.decode(str));

String processpayerrorResponseToJson(ProcesspayErrorResponse data) =>
    json.encode(data.toJson());

class ProcesspayErrorResponse {
  String msg;

  ProcesspayErrorResponse({
    required this.msg,
  });

  factory ProcesspayErrorResponse.fromJson(Map<String, dynamic> json) => ProcesspayErrorResponse(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
