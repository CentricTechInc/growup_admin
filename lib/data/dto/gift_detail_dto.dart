import 'package:grow_up_admin_panel/data/dto/user_dto.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

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
  UserModelDto? user;
  List<GiftingModel>? giftingModel;
  int? contributed;
  int? recieved;
  int? totalGifts;

  Data({this.user, this.contributed, this.recieved, this.totalGifts});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModelDto.fromJson(json['user']) : null;
    giftingModel = List<GiftingModel>.from(json['gifts'].map((e) => GiftingModel.fromJson(e)));
        // json['gifts'] != null ? GiftingModel.fromJson(json['gifts']) : null;
    contributed = json['contributed'];
    recieved = json['received'];
    totalGifts = json['totalGiftings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    // if (giftingModel != null) {
    //   data['gifts'] = giftingModel!.toJson();
    // }
    data['contributed'] = contributed;
    data['recieved'] = recieved;
    data['totalGifts'] = totalGifts;
    return data;
  }
}

class Beneficiary {
  String? name;
  String? bank;
  String? accountType;
  String? accountOwnerName;
  String? accountNumber;
  int? routingNumber;
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
    routingNumber = json['routing_number'];
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
    data['routing_number'] = routingNumber;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    return data;
  }
}
