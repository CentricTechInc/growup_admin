import 'dart:convert';

import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

class PayoutModel {
  final String? createdAt;
  final int? id;
  final String? transactionId;
  final String? amount;
  final int? giftId;
  final GiftingModel? gift;
  final String? beneficiary;
  final String? postedBy;

  PayoutModel({
    this.createdAt,
    this.id,
    this.transactionId,
    this.amount,
    this.giftId,
    this.gift,
    this.beneficiary,
    this.postedBy,
  });

  factory PayoutModel.fromRawJson(String str) =>
      PayoutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayoutModel.fromJson(Map<String, dynamic> json) => PayoutModel(
        createdAt: json["createdAt"],
        id: json["id"],
        transactionId: json["TransactionId"],
        amount: json["amount"],
        giftId: json["GiftId"],
        gift: json["Gift"] == null ? null : GiftingModel.fromJson(json["Gift"]),
        beneficiary: json["Beneficiary"],
        postedBy: json["PostedBy"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "id": id,
        "TransactionId": transactionId,
        "amount": amount,
        "GiftId": giftId,
        "Gift": gift?.toJson(),
        "Beneficiary": beneficiary,
        "PostedBy": postedBy,
      };
}
