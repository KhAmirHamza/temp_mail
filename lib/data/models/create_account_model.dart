// To parse this JSON data, do
//
//     final createAccountModel = createAccountModelFromJson(jsonString);

import 'dart:convert';

CreateAccountModel createAccountModelFromJson(String str) => CreateAccountModel.fromJson(json.decode(str));

String createAccountModelToJson(CreateAccountModel data) => json.encode(data.toJson());

class CreateAccountModel {
    String address;
    String password;

    CreateAccountModel({
        required this.address,
        required this.password,
    });

    factory CreateAccountModel.fromJson(Map<String, dynamic> json) => CreateAccountModel(
        address: json["address"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "password": password,
    };
}
