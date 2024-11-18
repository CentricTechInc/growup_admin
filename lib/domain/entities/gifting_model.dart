import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/user_dto.dart';

enum GiftStatus { Active, Expired }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

final giftStatusValues = EnumValues({
  "Active": GiftStatus.Active,
  "Expired": GiftStatus.Expired,
});

class GiftingModel {
  final String? picture;
  final String? createdAt;
  final int? id;
  final String? title;
  final String? purpose;
  final String? frequency;
  final String? publishDate;
  final String? description;
  final int? contributionCount;
  final String? contributionTotal;
  final GiftStatus? status;
  final String? recentContributionAmount;
  final int? userId;
  final int? beneficiaryId;
  final UserModelDto? user;
  final Beneficiary? beneficiary;
  bool isCollapsed;

  GiftingModel({
    this.picture,
    this.createdAt,
    this.id,
    this.title,
    this.purpose,
    this.frequency,
    this.publishDate,
    this.description,
    this.contributionCount,
    this.contributionTotal,
    this.status,
    this.recentContributionAmount,
    this.userId,
    this.beneficiaryId,
    this.user,
    this.beneficiary,
    this.isCollapsed = true,
  });

  factory GiftingModel.fromRawJson(String str) =>
      GiftingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GiftingModel.fromJson(Map<String, dynamic> json) => GiftingModel(
        picture: json["picture"],
        createdAt: json["createdAt"],
        id: json["id"],
        title: json["title"],
        purpose: json["purpose"],
        frequency: json["frequency"],
        publishDate: json["publish_date"],
        description: json["description"],
        contributionCount: json["contribution_count"],
        contributionTotal: json["contribution_total"],
        status: giftStatusValues.map[json["status"]],
        recentContributionAmount: json["recent_contribution_amount"],
        userId: json["UserId"],
        beneficiaryId: json["BeneficiaryId"],
        user: json["User"] == null ? null : UserModelDto.fromJson(json["User"]),
        beneficiary: json["Beneficiary"] == null
            ? null
            : Beneficiary.fromJson(json["Beneficiary"]),
      );

  Map<String, dynamic> toJson() => {
        "picture": picture,
        "createdAt": createdAt,
        "id": id,
        "title": title,
        "purpose": purpose,
        "frequency": frequency,
        "publish_date": publishDate,
        "description": description,
        "contribution_count": contributionCount,
        "contribution_total": contributionTotal,
        "status": giftStatusValues.reverse[status],
        "recent_contribution_amount": recentContributionAmount,
        "UserId": userId,
        "BeneficiaryId": beneficiaryId,
        "User": user?.toJson(),
        "Beneficiary": beneficiary?.toJson(),
      };
}

class Benefeciary {
  final String? name;
  final String? bank;
  final String? accountType;
  final String? accountOwnerName;
  final String? accountNumber;
  final String? city;
  final String? state;
  final String? zip;

  Benefeciary({
    this.name,
    this.bank,
    this.accountType,
    this.accountOwnerName,
    this.accountNumber,
    this.city,
    this.state,
    this.zip,
  });

  factory Benefeciary.fromRawJson(String str) =>
      Benefeciary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Benefeciary.fromJson(Map<String, dynamic> json) => Benefeciary(
        name: json["name"],
        bank: json["bank"],
        accountType: json["account_type"],
        accountOwnerName: json["account_owner_name"],
        accountNumber: json["account_number"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bank": bank,
        "account_type": accountType,
        "account_owner_name": accountOwnerName,
        "account_number": accountNumber,
        "city": city,
        "state": state,
        "zip": zip,
      };
}
