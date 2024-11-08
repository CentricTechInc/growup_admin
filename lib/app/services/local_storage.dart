import 'dart:convert';
import 'package:grow_up_admin_panel/data/dto/user_dto.dart';
import 'package:grow_up_admin_panel/domain/entities/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Key {
  user,
  fcmToken,
  userPic,
  audioCommand,
  isFirstTime,
  deviceDeails,
  deviceName
}

class LocalStorageService {
  SharedPreferences? _prefs;

  static final _singleton = LocalStorageService();

  static LocalStorageService get instance => _singleton;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // UserModelDto? get user {
  //   final rawJson = _prefs?.getString(Key.user.toString());
  //   if (rawJson == null) {
  //     return null;
  //   }
  //   return UserModelDto.fromRawJson(rawJson);
  // }
  set user(UserModelDto? value) {
    if (value != null) {
      _prefs?.setString(Key.user.toString(), json.encode(value).toString());
    } else {
      _prefs?.remove(Key.user.toString());
    }
  }

  String? get userPic {
    final base64Pic = _prefs?.getString(Key.userPic.toString());
    if (base64Pic == null) {
      return null;
    }
    return base64Pic;
  }

  set userPic(String? userImage) {
    if (userImage != null) {
      _prefs?.setString(Key.userPic.toString(), userImage);
    } else {
      _prefs?.remove(Key.userPic.toString());
    }
  }

  logoutUser() async {
    await _prefs?.remove(Key.user.toString());
  }
}
