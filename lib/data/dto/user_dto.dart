import 'dart:convert';

import 'package:grow_up_admin_panel/domain/entities/user_model.dart';

class UserDto extends UserModel {
  UserDto({
    super.email,
    super.password,
    super.role,
    super.token,
    super.userId,
    super.userName,
    super.message,
  });

  factory UserDto.fromRawJson(String str) => UserDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        userId: json["userId"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
        role: json["role"],
        userName: json["userName"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "password": password,
        "token": token,
        "role": role,
        "userName": userName,
        "message": message,
      };
}
