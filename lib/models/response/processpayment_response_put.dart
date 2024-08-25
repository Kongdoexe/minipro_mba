import 'dart:convert';

ProcesspaymentResponsePut processpaymentResponsePutFromJson(String str) =>
    ProcesspaymentResponsePut.fromJson(json.decode(str));

String processpaymentResponsePutToJson(ProcesspaymentResponsePut data) =>
    json.encode(data.toJson());

class ProcesspaymentResponsePut {
  List<LottoDelete>? lottoDelete;
  String msg;

  ProcesspaymentResponsePut({
    required this.lottoDelete,
    required this.msg,
  });

  factory ProcesspaymentResponsePut.fromJson(Map<String, dynamic> json) =>
      ProcesspaymentResponsePut(
        lottoDelete: json["LottoDelete"] == null
            ? null
            : List<LottoDelete>.from(
                json["LottoDelete"].map((x) => LottoDelete.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "LottoDelete": lottoDelete == null
            ? null
            : List<dynamic>.from(lottoDelete!.map((x) => x.toJson())),
        "msg": msg,
      };
}

class LottoDelete {
  int ticketId;
  int memberId;
  String number;
  int period;
  int price;

  LottoDelete({
    required this.ticketId,
    required this.memberId,
    required this.number,
    required this.period,
    required this.price,
  });

  factory LottoDelete.fromJson(Map<String, dynamic> json) => LottoDelete(
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
