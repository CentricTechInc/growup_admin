class DashboardListingDto {
  bool? status;
  String? message;
  Data? data;

  DashboardListingDto({this.status, this.message, this.data});

  DashboardListingDto.fromJson(Map<String, dynamic> json) {
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
  CountObjects? countObjects;
  List<PayoutObject>? payoutObject;
  List<RecentUsersObject>? recentUsersObject;
  List<RecentContributions>? recentContributions;

  Data(
      {this.countObjects,
      this.payoutObject,
      this.recentUsersObject,
      this.recentContributions});

  Data.fromJson(Map<String, dynamic> json) {
    countObjects = json['countObjects'] != null
        ? CountObjects.fromJson(json['countObjects'])
        : null;
    if (json['payoutObject'] != null) {
      payoutObject = <PayoutObject>[];
      json['payoutObject'].forEach((v) {
        payoutObject!.add(PayoutObject.fromJson(v));
      });
    }
    if (json['RecentUsersObject'] != null) {
      recentUsersObject = <RecentUsersObject>[];
      json['RecentUsersObject'].forEach((v) {
        recentUsersObject!.add(RecentUsersObject.fromJson(v));
      });
    }
    if (json['RecentContributions'] != null) {
      recentContributions = <RecentContributions>[];
      json['RecentContributions'].forEach((v) {
        recentContributions!.add(RecentContributions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (countObjects != null) {
      data['countObjects'] = countObjects!.toJson();
    }
    if (payoutObject != null) {
      data['payoutObject'] = payoutObject!.map((v) => v.toJson()).toList();
    }
    if (recentUsersObject != null) {
      data['RecentUsersObject'] =
          recentUsersObject!.map((v) => v.toJson()).toList();
    }
    if (recentContributions != null) {
      data['RecentContributions'] =
          recentContributions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountObjects {
  int? giftCount;
  int? totalgiftContributors;
  int? usersCount;

  CountObjects({this.giftCount, this.totalgiftContributors, this.usersCount});

  CountObjects.fromJson(Map<String, dynamic> json) {
    giftCount = json['giftCount'];
    totalgiftContributors = json['totalgiftContributors'];
    usersCount = json['usersCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['giftCount'] = giftCount;
    data['totalgiftContributors'] = totalgiftContributors;
    data['usersCount'] = usersCount;
    return data;
  }
}

class PayoutObject {
  String? createdAt;
  int? id;
  String? transactionId;
  String? amount;
  String? updatedAt;
  int? giftId;
  Gift? gift;
  String? parent;
  String? beneficiary;

  PayoutObject(
      {this.createdAt,
      this.id,
      this.transactionId,
      this.amount,
      this.updatedAt,
      this.giftId,
      this.gift,
      this.parent,
      this.beneficiary});

  PayoutObject.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    transactionId = json['TransactionId'];
    amount = json['amount'];
    updatedAt = json['updatedAt'];
    giftId = json['GiftId'];
    gift = json['Gift'] != null ? Gift.fromJson(json['Gift']) : null;
    parent = json['parent'];
    beneficiary = json['beneficiary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['createdAt'] = createdAt;
    data['id'] = id;
    data['TransactionId'] = transactionId;
    data['amount'] = amount;
    data['updatedAt'] = updatedAt;
    data['GiftId'] = giftId;
    if (gift != null) {
      data['Gift'] = gift!.toJson();
    }
    data['parent'] = parent;
    data['beneficiary'] = beneficiary;
    return data;
  }
}

class Gift {
  String? title;

  Gift({this.title});

  Gift.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    return data;
  }
}

class RecentUsersObject {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? status;

  RecentUsersObject({this.id, this.name, this.email, this.phone, this.status});

  RecentUsersObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}

class RecentContributions {
  String? createdAt;
  String? amount;
  String? transactionId;
  Gift? gift;

  RecentContributions(
      {this.createdAt, this.amount, this.transactionId, this.gift});

  RecentContributions.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    amount = json['amount'];
    transactionId = json['TransactionId'];
    gift = json['Gift'] != null ? Gift.fromJson(json['Gift']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['createdAt'] = createdAt;
    data['amount'] = amount;
    data['TransactionId'] = transactionId;
    if (gift != null) {
      data['Gift'] = gift!.toJson();
    }
    return data;
  }
}
