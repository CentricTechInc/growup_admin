import 'dart:convert';

import 'package:grow_up_admin_panel/domain/entities/register_model.dart';

class RegisterModelDto extends RegisterModel {
  RegisterModelDto({
    required super.username,
    required super.email,
    required super.password,
    required super.role,
  });

  factory RegisterModelDto.fromRawJson(String str) =>
      RegisterModelDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory RegisterModelDto.fromJson(Map<String, dynamic> json) {
    return RegisterModelDto(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }
}
