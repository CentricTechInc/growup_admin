import 'dart:convert';

import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';

class GiftPayoutModel {
  final AccountSummary? accountSummary;
  final List<PayoutModel>? payouts;

  GiftPayoutModel({
    this.accountSummary,
    this.payouts,
  });

  factory GiftPayoutModel.fromRawJson(String str) =>
      GiftPayoutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GiftPayoutModel.fromJson(Map<String, dynamic> json) =>
      GiftPayoutModel(
        accountSummary: json["account_summary"] == null
            ? null
            : AccountSummary.fromJson(json["account_summary"]),
        payouts: json["payouts"] == null
            ? []
            : List<PayoutModel>.from(
                json["payouts"]!.map((x) => PayoutModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "account_summary": accountSummary?.toJson(),
        "payouts": payouts == null
            ? []
            : List<dynamic>.from(payouts!.map((x) => x.toJson())),
      };
}

class AccountSummary {
  final String? contributionTotal;
  final String? platformFee;
  final String? taxDeduction;
  final double? balance;

  AccountSummary({
    this.contributionTotal,
    this.platformFee,
    this.taxDeduction,
    this.balance,
  });

  factory AccountSummary.fromRawJson(String str) =>
      AccountSummary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccountSummary.fromJson(Map<String, dynamic> json) => AccountSummary(
        contributionTotal: json["contribution_total"],
        platformFee: json["platform_fee"],
        taxDeduction: json["tax_deduction"],
        balance: json["balance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "contribution_total": contributionTotal,
        "platform_fee": platformFee,
        "tax_deduction": taxDeduction,
        "balance": balance,
      };
}
