import 'package:grow_up_admin_panel/data/dto/user_dto.dart';

abstract class AuthRepo {
  Future<UserModelDto> login(String email, String password);
  Future<String> forgotPassword(String email);
  Future<String> verifyOtp(String email, String otp);
  Future<String> generateOtp(String email);
  Future<String> changePassword(String email, String password);
}
