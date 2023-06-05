import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/home/data/datasources/home_datasources.dart';
import 'package:alertifyapp/features/home/domain/entities/custom_notification_entity.dart';
import 'package:alertifyapp/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final signOutRequest = await dataSources.signOut();

      return Right(signOutRequest);
    } on Exception catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> sendNotification(
      CustomNotificationMessageParams params) async {
    try {
      final sendRequest = await dataSources.sendNotification(params);

      return Right(sendRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CustomNotificationEntity>>>
      getNotifications() async {
    try {
      final listNotifications = await dataSources.getNotifications();

      return Right(listNotifications);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
