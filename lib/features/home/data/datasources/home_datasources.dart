import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';

abstract class HomeDataSources {
  Future<void> signOut();
  Future<dynamic> sendNotification(CustomNotificationMessageParams params);
}
