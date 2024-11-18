import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/user_dto.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

enum Status { Active, Expired, Successful }

class ContributionModel {
  final String? createdAt;
  final int? id;
  final String? amount;
  final Frequency? frequency;
  final String? contributionDate;
  final String? transactionId;
  final int? giftId;
  final int? contributorId;
  final GiftingModel? gift;
  final String? contributor;
  final String? beneficiary;
  final UserModelDto? user;
  final Status? status;

  ContributionModel({
    this.createdAt,
    this.id,
    this.amount,
    this.frequency,
    this.contributionDate,
    this.transactionId,
    this.giftId,
    this.contributorId,
    this.gift,
    this.contributor,
    this.beneficiary,
    this.user,
    this.status,
  });

  factory ContributionModel.fromRawJson(String str) =>
      ContributionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContributionModel.fromJson(Map<String, dynamic> json) =>
      ContributionModel(
        createdAt: json["createdAt"],
        id: json["id"],
        amount: json["amount"],
        frequency: frequencyValues.map[json["frequency"]],
        contributionDate: json["contribution_date"],
        transactionId: json["TransactionId"],
        giftId: json["GiftId"],
        contributorId: json["ContributorId"],
        gift: json["Gift"] == null ? null : GiftingModel.fromJson(json["Gift"]),
        user: json["User"] == null ? null : UserModelDto.fromJson(json["User"]),
        contributor: json["contributor"],
        beneficiary: json["beneficiary"],
        status: statusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "id": id,
        "amount": amount,
        "frequency": frequencyValues.reverse[frequency],
        "contribution_date": contributionDate,
        "TransactionId": transactionId,
        "GiftId": giftId,
        "ContributorId": contributorId,
        "Gift": gift?.toJson(),
        "contributor": contributor,
        "beneficiary": beneficiary,
        "status": statusValues.reverseMap[status],
      };
}

enum Frequency { Once, Weekly, Monthly, Quarterly }

final frequencyValues = EnumValues({
  "Monthly": Frequency.Monthly,
  "Once": Frequency.Once,
  "Weekly": Frequency.Weekly,
  "Quarterly": Frequency.Quarterly
});

final statusValues = EnumValues({
  "Active": Status.Active,
  "Expired": Status.Expired,
  "Successful": Status.Successful,
});
