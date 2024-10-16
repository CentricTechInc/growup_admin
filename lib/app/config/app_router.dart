import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/create_new_pass_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/forget_pass_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/login_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/otp_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/create_new_pass/create_new_pass_main.dart';
import 'package:grow_up_admin_panel/presentation/auth/forgot_password/forget_pass_main.dart';
import 'package:grow_up_admin_panel/presentation/auth/login/login_main.dart';
import 'package:grow_up_admin_panel/presentation/auth/otp/otp_main.dart';
import 'package:grow_up_admin_panel/presentation/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final globalContext = _rootNavigatorKey.currentContext;
// uncomment to use shell navigator
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();
final GlobalKey<OverlayState> overlayState = GlobalKey<OverlayState>();

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: PagePath.slash,
    observers: [],
    routes: [
      GoRoute(
        path: PagePath.slash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
          path: PagePath.login,
          builder: (context, state) {
            Get.lazyPut(
              () => LoginController(),
            );
            return const LoginMain();
          },
          routes: [
            GoRoute(
              path: PagePath.forgotPassword,
              builder: (context, state) {
                Get.lazyPut(
                  () => ForgetPassController(),
                );
                return const ForgetPassMain();
              },
            ),
            GoRoute(
              path: PagePath.createNewPassword,
              builder: (context, state) {
                Get.lazyPut(
                  () => CreateNewPassController(),
                );
                return const CreateNewPassMain();
              },
            ),
            GoRoute(
              path: PagePath.otp,
              builder: (context, state) {
                Get.lazyPut(
                  () => OtpController(),
                );
                return const OTPMain();
              },
            ),
          ]),
    ],
  );
}
