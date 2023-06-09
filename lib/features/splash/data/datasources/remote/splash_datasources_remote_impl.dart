import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/core/services/firebase_messaging_services.dart';
import 'package:alertifyapp/core/utils/const_routes.dart';
import 'package:alertifyapp/features/splash/data/datasources/splash_datasources.dart';

import '../../../../../core/global/mappers/user_mapper.dart';

class SplashDataSourcesRemoteImpl implements SplashDataSources {
  DatabaseService dataService;
  AuthService authService;
  ConstRoutes routes;
  FirebaseMessagingServices firebaseMessagingServices;
  SplashDataSourcesRemoteImpl(this.dataService, this.authService, this.routes,
      this.firebaseMessagingServices);

  @override
  Future router() async {
    final getDatabase = await dataService.tableUsers.get();

    final users = getDatabase.docs
        .map((e) => UserMapper.fromJson(e.data()))
        .where((element) => element.userId == authService.auth.currentUser!.uid)
        .toList();

    final user = users.first;

    final deviceToken =
        await firebaseMessagingServices.getDeviceFirebaseToken();

    await dataService.tableUsers.doc(user.docId).update({
      'fcmToken': deviceToken,
    });

    if (user.active) {
      if (user.isAdmin) {
        return routes.homeAdmin;
      }
      return routes.homeUsers;
    }

    return routes.notActive;
  }
}
