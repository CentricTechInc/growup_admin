class GiftDetailDto {
  bool? status;
  String? message;
  Data? data;

  GiftDetailDto({this.status, this.message, this.data});

  GiftDetailDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  int? contributed;

  Data({this.user, this.contributed});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    contributed = json['contributed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['contributed'] = contributed;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  List<Gifts>? gifts;
  int? totalGifts;

  User({this.name, this.email, this.phone, this.gifts, this.totalGifts});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    if (json['Gifts'] != null) {
      gifts = <Gifts>[];
      json['Gifts'].forEach((v) {
        gifts!.add(Gifts.fromJson(v));
      });
    }
    totalGifts = json['TotalGifts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    if (gifts != null) {
      data['Gifts'] = gifts!.map((v) => v.toJson()).toList();
    }
    data['TotalGifts'] = totalGifts;
    return data;
  }
}

class Gifts {
  String? picture;
  String? createdAt;
  int? id;
  String? title;
  String? purpose;
  String? frequency;
  String? publishDate;
  String? description;
  int? contributionCount;
  String? contributionTotal;
  String? status;
  String? recentContributionAmount;
  String? updatedAt;
  int? userId;
  int? beneficiaryId;
  Beneficiary? beneficiary;

  Gifts(
      {this.picture,
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
      this.updatedAt,
      this.userId,
      this.beneficiaryId,
      this.beneficiary});

  Gifts.fromJson(Map<String, dynamic> json) {
    picture = json['picture'];
    createdAt = json['createdAt'];
    id = json['id'];
    title = json['title'];
    purpose = json['purpose'];
    frequency = json['frequency'];
    publishDate = json['publish_date'];
    description = json['description'];
    contributionCount = json['contribution_count'];
    contributionTotal = json['contribution_total'];
    status = json['status'];
    recentContributionAmount = json['recent_contribution_amount'];
    updatedAt = json['updatedAt'];
    userId = json['UserId'];
    beneficiaryId = json['BeneficiaryId'];
    beneficiary = json['Beneficiary'] != null
        ? Beneficiary.fromJson(json['Beneficiary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['picture'] = picture;
    data['createdAt'] = createdAt;
    data['id'] = id;
    data['title'] = title;
    data['purpose'] = purpose;
    data['frequency'] = frequency;
    data['publish_date'] = publishDate;
    data['description'] = description;
    data['contribution_count'] = contributionCount;
    data['contribution_total'] = contributionTotal;
    data['status'] = status;
    data['recent_contribution_amount'] = recentContributionAmount;
    data['updatedAt'] = updatedAt;
    data['UserId'] = userId;
    data['BeneficiaryId'] = beneficiaryId;
    if (beneficiary != null) {
      data['Beneficiary'] = beneficiary!.toJson();
    }
    return data;
  }
}

class Beneficiary {
  String? name;
  String? bank;
  String? accountType;
  String? accountOwnerName;
  String? accountNumber;
  String? city;
  String? state;
  String? zip;

  Beneficiary(
      {this.name,
      this.bank,
      this.accountType,
      this.accountOwnerName,
      this.accountNumber,
      this.city,
      this.state,
      this.zip});

  Beneficiary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bank = json['bank'];
    accountType = json['account_type'];
    accountOwnerName = json['account_owner_name'];
    accountNumber = json['account_number'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['bank'] = bank;
    data['account_type'] = accountType;
    data['account_owner_name'] = accountOwnerName;
    data['account_number'] = accountNumber;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    return data;
  }
}
