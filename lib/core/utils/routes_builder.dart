import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/home/presentation/ui/home_view.dart';
import 'package:alertifyapp/features/home_admin/presentation/ui/home_admin_view.dart';
import 'package:alertifyapp/features/home_users/presenter/views/home_users_view.dart';
import 'package:alertifyapp/features/login/presentation/ui/login_view.dart';
import 'package:alertifyapp/features/not_active/presentation/ui/not_active_view.dart';
import 'package:alertifyapp/features/profile/presentation/views/profile_view.dart';
import 'package:alertifyapp/features/register/presentation/ui/register_view.dart';
import 'package:alertifyapp/features/splash/presentation/ui/splash_view.dart';
import 'package:alertifyapp/features/walkthrough/presentation/ui/walkthrough_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static builder(ConstRoutes routes) {
    return <String, WidgetBuilder>{
      routes.splash: (_) => const SplashView(),
      routes.login: (_) => const LoginView(),
      routes.register: (_) => const RegisterView(),
      routes.home: (_) => const HomeView(),
      routes.notActive: (_) => const NotActiveView(),
      routes.homeAdmin: (_) => const HomeAdminView(),
      routes.walkThroughView: (_) => const WalkthroughView(),
      routes.homeUsers: (_) => const HomeUserView(),
      routes.profileView: (_) => const ProfileView(),
    };
  }
}
