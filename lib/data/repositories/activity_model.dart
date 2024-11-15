import 'dart:convert';

import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

class ActivityModel {
  final String? createdAt;
  final int? id;
  final String? amount;
  final String? frequency;
  final DateTime? contributionDate;
  final String? transactionId;
  final int? giftId;
  final int? contributorId;
  final GiftingModel? gift;
  final String? beneficiary;

  ActivityModel({
    this.createdAt,
    this.id,
    this.amount,
    this.frequency,
    this.contributionDate,
    this.transactionId,
    this.giftId,
    this.contributorId,
    this.gift,
    this.beneficiary,
  });

  factory ActivityModel.fromRawJson(String str) =>
      ActivityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        createdAt: json["createdAt"],
        id: json["id"],
        amount: json["amount"],
        frequency: json["frequency"],
        contributionDate: json["contribution_date"] == null
            ? null
            : DateTime.parse(json["contribution_date"]),
        transactionId: json["TransactionId"],
        giftId: json["GiftId"],
        contributorId: json["ContributorId"],
        gift: json["Gift"] == null ? null : GiftingModel.fromJson(json["Gift"]),
        beneficiary: json["Beneficiary"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "id": id,
        "amount": amount,
        "frequency": frequency,
        "contribution_date": contributionDate,
        "TransactionId": transactionId,
        "GiftId": giftId,
        "ContributorId": contributorId,
        "Gift": gift?.toJson(),
        "Beneficiary": beneficiary,
      };
}
