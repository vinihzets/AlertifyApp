import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/features/home/data/datasources/home_datasources.dart';

class HomeDataSourcesRemoteImpl implements HomeDataSources {
  AuthService auth;
  DatabaseService databaseService;
  HomeDataSourcesRemoteImpl(this.auth, this.databaseService);

  @override
  Future<void> signOut() async {
    return auth.auth.signOut();
  }

  @override
  Future sendNotification(CustomNotificationMessageParams params) async {
    return databaseService.tableNotifications
        .add({'title': params.title, 'body': params.body}).then(
            (value) => databaseService.tableNotifications.doc(value.id).update({
                  'notificationId': value.id,
                }));
  }
}
