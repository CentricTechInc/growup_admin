import 'dart:convert';

class ParentModel {
  final String? picture;
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final bool? isVerified;
  final String? status;
  final String? googleId;
  final String? appleId;
  final String? registrationType;
  final int? totalGifts;
  final String? totalContributed;
  final String? totalReceived;
  final int? roleId;
  bool? isSelected;

  ParentModel({
    this.picture,
    this.isSelected = false,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isVerified,
    this.status,
    this.googleId,
    this.appleId,
    this.registrationType,
    this.roleId,
    this.totalGifts,
    this.totalContributed,
    this.totalReceived,
  });

  factory ParentModel.fromRawJson(String str) =>
      ParentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParentModel.fromJson(Map<String, dynamic> json) => ParentModel(
        picture: json["picture"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        isVerified: json["isVerified"],
        status: json["status"],
        googleId: json["googleId"],
        appleId: json["appleId"],
        registrationType: json["registration_type"],
        roleId: json["RoleId"],
        totalGifts: json["total_gifts"],
        totalContributed: json["total_contributed"],
        totalReceived: json["total_received"],
      );

  Map<String, dynamic> toJson() => {
        "picture": picture,
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "isVerified": isVerified,
        "status": status,
        "googleId": googleId,
        "appleId": appleId,
        "registration_type": registrationType,
        "RoleId": roleId,
        "total_contributed": totalContributed,
        "total_gifts": totalGifts,
        "total_received": totalReceived,
      };
}
