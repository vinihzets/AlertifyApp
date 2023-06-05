import 'package:alertifyapp/core/architecture/usecase.dart';

abstract class HomeDataSources {
  Future<void> signOut();
  Future<dynamic> sendNotification(CustomNotificationMessageParams params);
}
