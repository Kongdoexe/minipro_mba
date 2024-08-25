// To parse this JSON data, do
//
//     final changepasswordRequestPut = changepasswordRequestPutFromJson(jsonString);

import 'dart:convert';

ChangepasswordRequestPut changepasswordRequestPutFromJson(String str) => ChangepasswordRequestPut.fromJson(json.decode(str));

String changepasswordRequestPutToJson(ChangepasswordRequestPut data) => json.encode(data.toJson());

class ChangepasswordRequestPut {
    String oldPassword;
    String newPassword;

    ChangepasswordRequestPut({
        required this.oldPassword,
        required this.newPassword,
    });

    factory ChangepasswordRequestPut.fromJson(Map<String, dynamic> json) => ChangepasswordRequestPut(
        oldPassword: json["old_password"],
        newPassword: json["new_password"],
    );

    Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "new_password": newPassword,
    };
}
