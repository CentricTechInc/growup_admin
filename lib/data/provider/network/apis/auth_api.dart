import 'package:grow_up_admin_panel/data/dto/register_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum AuthApiType {
  login,
  forgot,
  otpVerification,
  generateOtp,
  resetPassword,
}

class AuthAPI implements APIRequestRepresentable {
  AuthApiType type;
  String? email,
      username,
      password,
      otp,
      confirmPassword,
      oldPassword,
      newPassword;
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
    this.username,
  });

  AuthAPI.login(String email, String pass)
      : this._(
          type: AuthApiType.login,
          email: email,
          password: pass,
        );
  AuthAPI.generateOtp(String email)
      : this._(type: AuthApiType.generateOtp, email: email);
  AuthAPI.otpVerification(String email, String otp)
      : this._(type: AuthApiType.otpVerification, email: email, otp: otp);

  AuthAPI.forgotPassword(String email)
      : this._(type: AuthApiType.forgot, email: email);

  AuthAPI.resetPassword(String email, String password)
      : this._(
            type: AuthApiType.resetPassword, email: email, password: password);
  @override
  get body {
    switch (type) {
      case AuthApiType.login:
        return {
          'email': email,
          'password': password,
        };

      case AuthApiType.resetPassword:
        return {'email': email, 'password': password};

      case AuthApiType.otpVerification:
        return {'email': email, 'otp': otp};
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
      case AuthApiType.generateOtp:
        return APIEndpoint.generateOtpUrl;
      case AuthApiType.forgot:
        return APIEndpoint.forgotPasswordUrl;
      case AuthApiType.resetPassword:
        return APIEndpoint.updatePasswordUrl;
      case AuthApiType.otpVerification:
        return APIEndpoint.verifyOtpUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case AuthApiType.generateOtp:
        return {'accept': ' */*'};
      case AuthApiType.forgot:
      case AuthApiType.login:
      case AuthApiType.resetPassword:
      case AuthApiType.otpVerification:
        return {
          // 'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthApiType.login:
      case AuthApiType.resetPassword:
      case AuthApiType.otpVerification:
        return HTTPMethod.post;
      case AuthApiType.generateOtp:
      case AuthApiType.forgot:
        return HTTPMethod.get;
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
        return {};
      case AuthApiType.forgot:
      case AuthApiType.generateOtp:
        return {
          'email': email ?? '',
        };
      case AuthApiType.resetPassword:
      case AuthApiType.otpVerification:
        return {};
    }
  }
}
