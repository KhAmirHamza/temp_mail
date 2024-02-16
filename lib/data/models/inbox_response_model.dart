// To parse this JSON data, do
//
//     final inboxResponseModel = inboxResponseModelFromJson(jsonString);

import 'dart:convert';

InboxResponseModel inboxResponseModelFromJson(String str) => InboxResponseModel.fromJson(json.decode(str));

String inboxResponseModelToJson(InboxResponseModel data) => json.encode(data.toJson());

class InboxResponseModel {
    String id;
    String type;
    String inboxResponseModelId;
    String accountId;
    String msgid;
    From from;
    List<From> to;
    String subject;
    String intro;
    bool seen;
    bool isDeleted;
    bool hasAttachments;
    int size;
    String downloadUrl;
    DateTime createdAt;
    DateTime updatedAt;

    InboxResponseModel({
        required this.id,
        required this.type,
        required this.inboxResponseModelId,
        required this.accountId,
        required this.msgid,
        required this.from,
        required this.to,
        required this.subject,
        required this.intro,
        required this.seen,
        required this.isDeleted,
        required this.hasAttachments,
        required this.size,
        required this.downloadUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    factory InboxResponseModel.fromJson(Map<String, dynamic> json) => InboxResponseModel(
        id: json["@id"],
        type: json["@type"],
        inboxResponseModelId: json["id"],
        accountId: json["accountId"],
        msgid: json["msgid"],
        from: From.fromJson(json["from"]),
        to: List<From>.from(json["to"].map((x) => From.fromJson(x))),
        subject: json["subject"],
        intro: json["intro"],
        seen: json["seen"],
        isDeleted: json["isDeleted"],
        hasAttachments: json["hasAttachments"],
        size: json["size"],
        downloadUrl: json["downloadUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": inboxResponseModelId,
        "accountId": accountId,
        "msgid": msgid,
        "from": from.toJson(),
        "to": List<dynamic>.from(to.map((x) => x.toJson())),
        "subject": subject,
        "intro": intro,
        "seen": seen,
        "isDeleted": isDeleted,
        "hasAttachments": hasAttachments,
        "size": size,
        "downloadUrl": downloadUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class From {
    String name;
    String address;

    From({
        required this.name,
        required this.address,
    });

    factory From.fromJson(Map<String, dynamic> json) => From(
        name: json["name"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
    };
}
