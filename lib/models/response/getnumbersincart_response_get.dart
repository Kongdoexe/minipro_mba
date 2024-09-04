// To parse this JSON data, do
//
//     final getnumbersincartResponseGet = getnumbersincartResponseGetFromJson(jsonString);

import 'dart:convert';

GetnumbersincartResponseGet getnumbersincartResponseGetFromJson(String str) => GetnumbersincartResponseGet.fromJson(json.decode(str));

String getnumbersincartResponseGetToJson(GetnumbersincartResponseGet data) => json.encode(data.toJson());

class GetnumbersincartResponseGet {
    int allprice;
    List<Datum> data;

    GetnumbersincartResponseGet({
        required this.allprice,
        required this.data,
    });

    factory GetnumbersincartResponseGet.fromJson(Map<String, dynamic> json) => GetnumbersincartResponseGet(
        allprice: json["Allprice"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Allprice": allprice,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int cartId;
    int memberId;
    String numLotto;
    LottoData lottoData;

    Datum({
        required this.cartId,
        required this.memberId,
        required this.numLotto,
        required this.lottoData,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartId: json["cart_id"],
        memberId: json["member_id"],
        numLotto: json["num_lotto"],
        lottoData: LottoData.fromJson(json["lotto_data"]),
    );

    Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "member_id": memberId,
        "num_lotto": numLotto,
        "lotto_data": lottoData.toJson(),
    };
}

class LottoData {
    int ticketId;
    dynamic memberId;
    String number;
    int period;
    int price;

    LottoData({
        required this.ticketId,
        required this.memberId,
        required this.number,
        required this.period,
        required this.price,
    });

    factory LottoData.fromJson(Map<String, dynamic> json) => LottoData(
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
