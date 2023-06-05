import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, dynamic>> sendNotification(
      CustomNotificationMessageParams params);
  Future<Either<Failure, List<CustomNotificationEntity>>> getNotifications();
}
