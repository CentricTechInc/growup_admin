import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/app/config/app.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  LocalStorageService.instance.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const GrowUpAdminPanel());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
