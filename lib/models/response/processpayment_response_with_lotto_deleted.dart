import 'dart:convert';

ProcesspaymentResponseWithLottoDeleted
    processpaymentResponseWithLottoDeletedFromJson(String str) =>
        ProcesspaymentResponseWithLottoDeleted.fromJson(json.decode(str));

String processpaymentResponseWithLottoDeletedToJson(
        ProcesspaymentResponseWithLottoDeleted data) =>
    json.encode(data.toJson());

class ProcesspaymentResponseWithLottoDeleted {
  List<String> lottoDeleted;
  String msg;

  ProcesspaymentResponseWithLottoDeleted({
    required this.lottoDeleted,
    required this.msg,
  });

  factory ProcesspaymentResponseWithLottoDeleted.fromJson(
          Map<String, dynamic> json) =>
      ProcesspaymentResponseWithLottoDeleted(
        lottoDeleted: json["LottoDeleted"] != null
            ? List<String>.from(json["LottoDeleted"])
            : [], // ใช้ List ว่างถ้า LottoDeleted เป็น null
        msg: json["msg"] ?? '', // ใช้ข้อความว่างถ้า msg เป็น null
      );

  Map<String, dynamic> toJson() => {
        "LottoDeleted": List<dynamic>.from(lottoDeleted),
        "msg": msg,
      };
}
