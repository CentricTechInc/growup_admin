import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/register_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum AuthApiType {
  login,
  signup,
  forgot,
  generateOtp,
  forgotEmailOtpVerification,
  resetPassword,
  registerEmailVerification,
  changePassword,
}

class AuthAPI implements APIRequestRepresentable {
  AuthApiType type;
  String? email,
      username,
      password,
      otp,
      confirmPassword,
      oldPassword,
      newPassword,
      fcmToken;
  RegisterModelDto? data;

  AuthAPI._({
    required this.type,
    this.email,
    this.password,
    this.otp,
    this.data,
    this.confirmPassword,
    this.oldPassword,
    this.newPassword,
    this.fcmToken,
    this.username,
  });

  AuthAPI.login(String email, String pass, String fcmToken)
      : this._(
            type: AuthApiType.login,
            email: email,
            password: pass,
            fcmToken: fcmToken);

  AuthAPI.register(RegisterModelDto data)
      : this._(type: AuthApiType.signup, data: data);

  AuthAPI.generateOtp(String email)
      : this._(type: AuthApiType.generateOtp, email: email);

  AuthAPI.forgotPassword(String email)
      : this._(type: AuthApiType.forgot, email: email);

  AuthAPI.resetPassword(String email, String password, String confirmPassword)
      : this._(
            type: AuthApiType.resetPassword,
            email: email,
            confirmPassword: confirmPassword,
            password: password);

  AuthAPI.forgotEmailOtpVerification(String email, String otp)
      : this._(
            type: AuthApiType.forgotEmailOtpVerification,
            email: email,
            otp: otp);

  AuthAPI.registerEmailVerification(String email, String otp)
      : this._(
            type: AuthApiType.registerEmailVerification,
            email: email,
            otp: otp);

  AuthAPI.changePassword(
      String username, String oldPassword, String newPassword)
      : this._(
          type: AuthApiType.changePassword,
          username: username,
          oldPassword: oldPassword,
          newPassword: newPassword,
        );

  @override
  get body {
    switch (type) {
      case AuthApiType.login:
        return jsonEncode({
          'userEmail': email,
          'password': password,
          'deviceToken': fcmToken.toString(),
        });
      case AuthApiType.changePassword:
        return jsonEncode({
          "username": username.toString(),
          "oldPassword": oldPassword.toString(),
          "newPassword": newPassword.toString(),
        });
      case AuthApiType.signup:
        return data?.toRawJson();
      case AuthApiType.resetPassword:
        return jsonEncode(
            {'email': email.toString(), 'password': password.toString()});
      case AuthApiType.forgotEmailOtpVerification:
      case AuthApiType.registerEmailVerification:
      case AuthApiType.forgot:
      case AuthApiType.generateOtp:
        return {};
    }
  }

  @override
  String get path {
    switch (type) {
      case AuthApiType.login:
        return APIEndpoint.loginUrl;
      case AuthApiType.signup:
        return APIEndpoint.registerUrl;
      case AuthApiType.generateOtp:
        return APIEndpoint.generateOtpUrl;
      case AuthApiType.forgot:
        return APIEndpoint.forgotPasswordUrl;
      case AuthApiType.resetPassword:
        return APIEndpoint.resetPasswordUrl;
      case AuthApiType.forgotEmailOtpVerification:
        return APIEndpoint.forgotOtpVerificationUrl;
      case AuthApiType.registerEmailVerification:
        return APIEndpoint.registerOTpVerificationUrl;
      case AuthApiType.changePassword:
        return APIEndpoint.changePasswordUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case AuthApiType.registerEmailVerification:
      case AuthApiType.forgotEmailOtpVerification:
        return {};
      case AuthApiType.generateOtp:
        return {'accept': ' */*'};
      case AuthApiType.forgot:
      case AuthApiType.login:
      case AuthApiType.signup:
      case AuthApiType.resetPassword:
      case AuthApiType.changePassword:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthApiType.login:
      case AuthApiType.signup:
      case AuthApiType.registerEmailVerification:
      case AuthApiType.forgotEmailOtpVerification:
      case AuthApiType.generateOtp:
      case AuthApiType.changePassword:
      case AuthApiType.resetPassword:
      case AuthApiType.forgot:
        return HTTPMethod.post;
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case AuthApiType.login:
      case AuthApiType.signup:
      case AuthApiType.changePassword:
      case AuthApiType.forgot:
      case AuthApiType.resetPassword:
        return {};
      case AuthApiType.generateOtp:
        return {
          'email': email.toString(),
        };
      case AuthApiType.forgotEmailOtpVerification:
        return {
          'email': email.toString(),
          'otp': otp.toString(),
          'type': 'NewPassword'.toString(),
        };
      case AuthApiType.registerEmailVerification:
        return {
          'email': email.toString(),
          'otp': otp.toString(),
          'type': 'Registration'.toString()
        };
    }
  }
}
