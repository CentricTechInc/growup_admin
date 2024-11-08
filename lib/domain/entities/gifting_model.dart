import 'dart:convert';

class GiftingModel {
  final String? createdAt;
  final int? id;
  final String? amount;
  final String? frequency;
  final DateTime? contributionDate;
  final String? transactionId;
  final int? giftId;
  final int? contributorId;
  final User? user;

  GiftingModel({
    this.createdAt,
    this.id,
    this.amount,
    this.frequency,
    this.contributionDate,
    this.transactionId,
    this.giftId,
    this.contributorId,
    this.user,
  });

  factory GiftingModel.fromRawJson(String str) => GiftingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GiftingModel.fromJson(Map<String, dynamic> json) => GiftingModel(
    createdAt: json["createdAt"],
    id: json["id"],
    amount: json["amount"],
    frequency: json["frequency"],
    contributionDate: json["contribution_date"] == null ? null : DateTime.parse(json["contribution_date"]),
    transactionId: json["TransactionId"],
    giftId: json["GiftId"],
    contributorId: json["ContributorId"],
    user: json["User"] == null ? null : User.fromJson(json["User"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "id": id,
    "amount": amount,
    "frequency": frequency,
    "contribution_date": "${contributionDate!.year.toString().padLeft(4, '0')}-${contributionDate!.month.toString().padLeft(2, '0')}-${contributionDate!.day.toString().padLeft(2, '0')}",
    "TransactionId": transactionId,
    "GiftId": giftId,
    "ContributorId": contributorId,
    "User": user?.toJson(),
  };
}

class User {
  final String? name;

  User({
    this.name,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
