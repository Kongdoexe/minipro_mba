import 'dart:convert';

ProcesspaySuccessResponse processpaysuccessResponseFromJson(String str) =>
    ProcesspaySuccessResponse.fromJson(json.decode(str));

String processpaysuccessResponseToJson(ProcesspaySuccessResponse data) =>
    json.encode(data.toJson());

class ProcesspaySuccessResponse {
  String msg;

  ProcesspaySuccessResponse({
    required this.msg,
  });

  factory ProcesspaySuccessResponse.fromJson(Map<String, dynamic> json) => ProcesspaySuccessResponse(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
