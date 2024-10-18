import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/create_new_pass_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/forget_pass_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/login_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/controllers/otp_controller.dart';
import 'package:grow_up_admin_panel/presentation/auth/create_new_pass/create_new_pass_main.dart';
import 'package:grow_up_admin_panel/presentation/auth/forgot_password/forget_pass_main.dart';
import 'package:grow_up_admin_panel/presentation/auth/login/login_main.dart';
import 'package:grow_up_admin_panel/presentation/auth/otp/otp_main.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/admin_dashboard_desktop.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/dashboard_page.dart';
import 'package:grow_up_admin_panel/presentation/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final globalContext = _rootNavigatorKey.currentContext;
// uncomment to use shell navigator
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<OverlayState> overlayState = GlobalKey<OverlayState>();

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: PagePath.slash,
    // redirect: (context, state) {
    //   if (LocalStorageService.instance.user == null) {
    //     switch (state.uri.path) {
    //       case PagePath.login:
    //         return PagePath.login;
    //       case PagePath.forgotPassword:
    //         return PagePath.forgotPassword;
    //       case PagePath.otp:
    //         return PagePath.otp;
    //       case PagePath.createNewPassword:
    //         return PagePath.createNewPassword;
    //     }
    //     return PagePath.login;
    //   }
    //   return null;
    // },
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
      //Dashboard

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          Get.put<SideBarController>(SideBarController(), permanent: true);
          return AdminDashboard(
            child: child,
          );
        },
        routes: [
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.dashboard,
              pageBuilder: (context, state) {
                return const MaterialPage(child: DashboardPage());
              }),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.userParents,
              pageBuilder: (context, state) {
                return MaterialPage(child: SizedBox());
              }),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.userContributor,
              pageBuilder: (context, state) => MaterialPage(child: SizedBox())),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.giftings,
              pageBuilder: (context, state) {
                return MaterialPage(child: SizedBox());
              }),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: PagePath.contrbutors,
            pageBuilder: (context, state) {
              return const MaterialPage(child: SizedBox());
            },
          ),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.payouts,
              pageBuilder: (context, state) {
                return MaterialPage(child: SizedBox());
              }),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: PagePath.analytics,
            pageBuilder: (context, state) {
              return const MaterialPage(child: SizedBox());
            },
          ),
        ],
      ),
    ],
  );
}
