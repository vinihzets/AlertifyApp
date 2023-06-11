import 'dart:developer';

import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/core/services/firebase_messaging_services.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/login/data/datasources/login_datasources.dart';
import 'package:alertifyapp/core/global/mappers/user_mapper.dart';

class LoginDataSourcesRemoteImpl implements LoginDataSources {
  AuthService auth;
  FirebaseMessagingServices service;
  DatabaseService databaseService;
  ConstRoutes routes;
  LoginDataSourcesRemoteImpl(
      this.auth, this.service, this.databaseService, this.routes);
  @override
  Future<String> signIn(SignInParams params) async {
    final loginRequest = await auth.auth.signInWithEmailAndPassword(
        email: params.email, password: params.password);

    if (loginRequest.user != null) {
      final tableUsers = await databaseService.tableUsers.get();

      final listUsers = tableUsers.docs
          .map((e) => UserMapper.fromJson(e.data()))
          .where((element) => element.userId == auth.auth.currentUser!.uid)
          .toList();

      final user = listUsers.first;

      final deviceToken = await service.getDeviceFirebaseToken();
      inspect(deviceToken);

      databaseService.tableUsers.doc(user.docId).update({
        'fcmToken': deviceToken,
      });

      if (user.isAdmin) {
        return routes.homeAdmin;
      } else if (user.active) {
        return routes.home;
      }
    }

    return routes.notActive;
  }
}
