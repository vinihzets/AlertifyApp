import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';

abstract class HomeDataSources {
  Future<void> signOut();
  Future<dynamic> sendNotification(CustomNotificationMessageParams params);
  Future<List<CustomNotificationEntity>> getNotifications();
}
