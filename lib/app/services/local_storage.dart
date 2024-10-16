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

  UserModel? get user {
    final rawJson = _prefs?.getString(Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    return UserDto.fromRawJson(rawJson);
  }

  set voiceCommand(List<String> voiceCommand) {
    if (voiceCommand.isNotEmpty) {
      _prefs?.setStringList(Key.audioCommand.toString(), voiceCommand);
    }
  }

  List<String>? get getVoiceCommand {
    final commands = _prefs?.getStringList(Key.audioCommand.toString());
    if (commands == null) {
      return null;
    }
    return commands;
  }

  set user(UserModel? value) {
    if (value != null) {
      _prefs?.setString(Key.user.toString(), json.encode(value).toString());
    } else {
      _prefs?.remove(Key.user.toString());
    }
  }

  String? get fcmToken {
    final token = _prefs?.getString(Key.fcmToken.toString());
    if (token == null) {
      return null;
    }
    return token;
  }

  set fcmToken(String? token) {
    if (token != null) {
      _prefs?.setString(Key.fcmToken.toString(), token);
    } else {
      _prefs?.remove(Key.fcmToken.toString());
    }
  }

  String? get deviceName {
    final deviceName = _prefs?.getString(Key.deviceName.toString());
    if (deviceName == null) {
      return null;
    }
    return deviceName;
  }

  set deviceName(String? token) {
    if (token != null) {
      _prefs?.setString(Key.deviceName.toString(), token);
    } else {
      _prefs?.remove(Key.deviceName.toString());
    }
  }

  bool get isFirstTime {
    final isFirst = _prefs?.getBool(Key.isFirstTime.name);
    if (isFirst == null) {
      return true;
    }
    return isFirst;
  }

  set isFirstTime(bool? isFirst) {
    if (isFirst != null) {
      _prefs?.setBool(Key.isFirstTime.name, isFirst);
    } else {
      _prefs?.remove(Key.isFirstTime.name);
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
    await _prefs?.remove(Key.audioCommand.toString());
    await _prefs?.remove(Key.user.toString());
  }
}
