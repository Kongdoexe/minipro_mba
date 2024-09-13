import 'dart:convert';

List<GetprizeResponseGet> getprizeResponseGetFromJson(String str) {
  try {
    return List<GetprizeResponseGet>.from(
        json.decode(str).map((x) => GetprizeResponseGet.fromJson(x)));
  } catch (e) {
    print("Error parsing JSON: $e");
    return [];
  }
}

String getprizeResponseGetToJson(List<GetprizeResponseGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetprizeResponseGet {
  int? period;
  List<Result> results;

  GetprizeResponseGet({
    this.period,
    required this.results,
  });

  factory GetprizeResponseGet.fromJson(Map<String, dynamic> json) {
    return GetprizeResponseGet(
      period: json["Period"] as int?,
      results: json["Results"] != null
          ? List<Result>.from(
              json["Results"].map((x) => Result.fromJson(x as Map<String, dynamic>)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "Period": period,
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  int? winnerId;
  int? rank;
  String? number;
  dynamic memberId;
  int? gratuity;

  Result({
    this.winnerId,
    this.rank,
    this.number,
    this.memberId,
    this.gratuity,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      winnerId: json["WinnerID"] as int?,
      rank: json["Rank"] as int?,
      number: json["Number"] as String?,
      memberId: json["MemberID"],
      gratuity: json["Gratuity"] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        "WinnerID": winnerId,
        "Rank": rank,
        "Number": number,
        "MemberID": memberId,
        "Gratuity": gratuity,
      };
}