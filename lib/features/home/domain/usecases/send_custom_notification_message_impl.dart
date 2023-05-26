import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class SendCustomNotificationMessage
    implements UseCase<CustomNotificationMessageParams, dynamic> {
  HomeRepository repository;

  SendCustomNotificationMessage(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(
      CustomNotificationMessageParams params) {
    return repository.sendNotification(params);
  }
}
