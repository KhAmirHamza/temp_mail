// To parse this JSON data, do
//
//     final domainModel = domainModelFromJson(jsonString);

import 'dart:convert';

DomainModel domainModelFromJson(String str) => DomainModel.fromJson(json.decode(str));

String domainModelToJson(DomainModel data) => json.encode(data.toJson());

class DomainModel {
    String id;
    String type;
    String domainModelId;
    String domain;
    bool isActive;
    bool isPrivate;
    DateTime createdAt;
    DateTime updatedAt;

    DomainModel({
        required this.id,
        required this.type,
        required this.domainModelId,
        required this.domain,
        required this.isActive,
        required this.isPrivate,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DomainModel.fromJson(Map<String, dynamic> json) => DomainModel(
        id: json["@id"],
        type: json["@type"],
        domainModelId: json["id"],
        domain: json["domain"],
        isActive: json["isActive"],
        isPrivate: json["isPrivate"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": domainModelId,
        "domain": domain,
        "isActive": isActive,
        "isPrivate": isPrivate,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
