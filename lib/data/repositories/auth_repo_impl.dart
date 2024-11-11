import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/user_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/auth_api.dart';
import 'package:grow_up_admin_panel/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<UserModelDto> login(String email, String password) async {
    try {
      final response = await AuthAPI.login(email, password).request();
      return UserModelDto.fromJson(jsonDecode(response)['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> forgotPassword(String email) async {
    try {
      final response = await AuthAPI.forgotPassword(email).request();
      return jsonDecode(response)['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> verifyOtp(String email, String otp) async {
    try {
      final response = await AuthAPI.otpVerification(email, otp).request();
      return jsonDecode(response)['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> generateOtp(String email) async {
    try {
      final response = await AuthAPI.generateOtp(email).request();
      return jsonDecode(response)['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> changePassword(String email, String password) async {
    try {
      final response = await AuthAPI.resetPassword(email, password).request();
      return jsonDecode(response)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
