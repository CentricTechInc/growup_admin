class UserBeneficiaryDto {
  bool? status;
  String? message;
  List<Data>? data;

  UserBeneficiaryDto({this.status, this.message, this.data});

  UserBeneficiaryDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? picture;
  int? id;
  String? name;
  String? relation;
  String? dateOfBirth;
  String? phone;
  int? age;
  int? contributionCount;
  String? bank;
  String? accountType;
  String? accountOwnerName;
  String? accountNumber;
  int? routingNumber;
  String? city;
  String? state;
  String? zip;
  String? contributionTotal;
  String? status;

  Data(
      {this.picture,
      this.id,
      this.name,
      this.relation,
      this.dateOfBirth,
      this.phone,
      this.age,
      this.contributionCount,
      this.bank,
      this.accountType,
      this.accountOwnerName,
      this.accountNumber,
      this.routingNumber,
      this.city,
      this.state,
      this.zip,
      this.contributionTotal,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    picture = json['picture'];
    id = json['id'];
    name = json['name'];
    relation = json['relation'];
    dateOfBirth = json['date_of_birth'];
    phone = json['phone'];
    age = json['age'];
    contributionCount = json['contribution_count'];
    bank = json['bank'];
    accountType = json['account_type'];
    accountOwnerName = json['account_owner_name'];
    accountNumber = json['account_number'];
    routingNumber = json['routing_number'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    contributionTotal = json['contribution_total'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['picture'] = picture;
    data['id'] = id;
    data['name'] = name;
    data['relation'] = relation;
    data['date_of_birth'] = dateOfBirth;
    data['phone'] = phone;
    data['age'] = age;
    data['contribution_count'] = contributionCount;
    data['bank'] = bank;
    data['account_type'] = accountType;
    data['account_owner_name'] = accountOwnerName;
    data['account_number'] = accountNumber;
    data['routing_number'] = routingNumber;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['contribution_total'] = contributionTotal;
    data['status'] = status;
    return data;
  }
}
