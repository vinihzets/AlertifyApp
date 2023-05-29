import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/users/data/datasources/user_datasources.dart';
import 'package:alertifyapp/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  UserDataSources dataSources;

  UserRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, List<UserEntity>>> fetchUsers() async {
    try {
      final fetchRequest = await dataSources.fetchUsers();

      return Right(fetchRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> activate(
      ActivateUserParams params) async {
    try {
      final active = await dataSources.activate(params);
      return Right(active);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(UserEntity entity) async {
    try {
      final deleteRequest = await dataSources.deleteUser(entity);

      return Right(deleteRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
