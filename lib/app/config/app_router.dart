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
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/user_parent_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/gift_detail_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_contributors_details.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_details.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/user_parent_live_gifting_widget.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/admin_dashboard_desktop.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/analytics_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/contributions_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/dashboard_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/giftings_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/payout_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_contribution_page.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';
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
    redirect: (context, state) {
      if (LocalStorageService.instance.user?.token == null) {
        switch (state.uri.path) {
          case PagePath.login:
            return PagePath.login;
          case PagePath.forgotPassword:
            return PagePath.forgotPassword;
          case PagePath.otp:
            return PagePath.otp;
          case PagePath.createNewPassword:
            return PagePath.createNewPassword;
        }
        return PagePath.login;
      }
      return null;
    },
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
              path: "${PagePath.createNewPassword}/:email",
              builder: (context, state) {
                String email = state.pathParameters['email'] as String;
                Get.lazyPut(
                  () => CreateNewPassController(),
                );
                return CreateNewPassMain(
                  email: email,
                );
              },
            ),
            GoRoute(
              path: "${PagePath.otp}/:email",
              builder: (context, state) {
                String email = state.pathParameters['email'] as String;
                Get.lazyPut(
                  () => OtpController(),
                );
                return OTPMain(
                  email: email,
                );
              },
            ),
          ]),
      //Dashboard

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          Get.put<SideBarController>(SideBarController(), permanent: true);
          Get.put<DashboardController>(DashboardController(), permanent: true);
          return AdminDashboard(
            child: child,
          );
        },
        routes: [
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.dashboard,
              pageBuilder: (context, state) {
                return MaterialPage(child: DashboardPage());
              }),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.userParents,
              pageBuilder: (context, state) {
                Get.lazyPut(
                  () => UserParentController(),
                );
                return const MaterialPage(child: UserParentPage());
              },
              routes: [
                GoRoute(
                  path: PagePath.parentDetails,
                  pageBuilder: (context, state) {
                    final bool val = bool.parse(
                        state.uri.queryParameters['isParent'].toString());
                    return MaterialPage(
                      child: UserParentDetails(
                        isParent: val,
                      ),
                    );
                  },
                ),
              ]),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.userContributor,
              pageBuilder: (context, state) {
                return MaterialPage(child: UserContributionPage());
              },
              routes: [
                // GoRoute(
                //   parentNavigatorKey: _shellNavigatorKey,
                //   path: PagePath.contributorDetails,
                //   pageBuilder: (context, state) {
                //     return MaterialPage(child: UserContributerDetails());
                //   },
                // ),
              ]),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.giftings,
              pageBuilder: (context, state) {
                return const MaterialPage(child: GiftingsPage());
              },
              routes: [
                GoRoute(
                  path: PagePath.parentDetails,
                  pageBuilder: (context, state) {
                    final bool val = bool.parse(
                        state.uri.queryParameters['isParent'].toString());
                    return MaterialPage(
                      child: UserParentDetails(
                        isParent: val,
                      ),
                    );
                  },
                ),
              ]),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: PagePath.contrbutions,
            pageBuilder: (context, state) {
              return const MaterialPage(child: ContributionPage());
            },
          ),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.payouts,
              pageBuilder: (context, state) {
                return const MaterialPage(child: PayoutPage());
              },
              routes: [
                GoRoute(
                  path: PagePath.parentDetails,
                  pageBuilder: (context, state) {
                    final bool val = bool.parse(
                        state.uri.queryParameters['isParent'].toString());
                    return MaterialPage(
                        child: UserParentDetails(
                      isParent: val,
                    ));
                  },
                ),
              ]),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: PagePath.analytics,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: AnalyticsPage(),
              );
            },
          ),
          GoRoute(
            path: PagePath.giftDetails,
            pageBuilder: (context, state) {
              return MaterialPage(child: GiftDetailPage());
            },
          ),
        ],
      ),
    ],
  );
}
