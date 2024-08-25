import 'dart:convert';

ProcesspaymentResponseWithLottoDeleted processpaymentResponseWithLottoDeletedFromJson(String str) =>
    ProcesspaymentResponseWithLottoDeleted.fromJson(json.decode(str));

String processpaymentResponseWithLottoDeletedToJson(ProcesspaymentResponseWithLottoDeleted data) =>
    json.encode(data.toJson());

class ProcesspaymentResponseWithLottoDeleted {
  List<String> lottoDeleted;
  String msg;

  ProcesspaymentResponseWithLottoDeleted({
    required this.lottoDeleted,
    required this.msg,
  });

  factory ProcesspaymentResponseWithLottoDeleted.fromJson(Map<String, dynamic> json) =>
      ProcesspaymentResponseWithLottoDeleted(
        lottoDeleted: List<String>.from(json["LottoDeleted"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "LottoDeleted": List<dynamic>.from(lottoDeleted),
        "msg": msg,
      };
}
