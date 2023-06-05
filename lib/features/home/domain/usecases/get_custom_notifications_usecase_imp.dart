import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';
import 'package:alertifyapp/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetCustomNotificationsUseCaseImpl
    implements UseCase<NoParams, List<CustomNotificationEntity>> {
  HomeRepository repository;

  GetCustomNotificationsUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<CustomNotificationEntity>>> call(
      NoParams params) {
    return repository.getNotifications();
  }
}
