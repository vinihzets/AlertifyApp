import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/services/auth_services.dart';
import 'package:alertifyapp/core/services/database_services.dart';
import 'package:alertifyapp/features/home/data/datasources/home_datasources.dart';
import 'package:alertifyapp/features/home/data/mappers/custom_notification_mapper.dart';
import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';

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
    final doc = databaseService.tableNotifications.doc();

    await doc.set({
      'title': params.title,
      'body': params.body,
      'notificationId': doc.id,
      'senderId': auth.auth.currentUser!.uid
    });

    final notifications = await databaseService.tableNotifications.get();

    final listNotifications = notifications.docs
        .map((e) => CustomNotificationMapper.fromJson(e.data()))
        .where((element) => element.senderId == auth.auth.currentUser!.uid)
        .toList();

    return listNotifications;
  }

  @override
  Future<List<CustomNotificationEntity>> getNotifications() async {
    final notifications = await databaseService.tableNotifications.get();

    final listNotifications = notifications.docs
        .map((e) => CustomNotificationMapper.fromJson(e.data()))
        .where((element) => element.senderId == auth.auth.currentUser!.uid)
        .toList();

    return listNotifications;
  }
}
