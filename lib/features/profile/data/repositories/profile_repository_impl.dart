import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/profile/data/datasources/profile_datasources.dart';
import 'package:alertifyapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDataSources dataSources;

  ProfileRepositoryImpl(this.dataSources);

  Future<Either<Failure, UserEntity>> fetchUser() async {
    try {
      final fetchRequest = await dataSources.fetchUser();

      return Right(fetchRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteUser(UserEntity entity) async {
    try {
      final deleteUser = await dataSources.deleteUser(entity);

      return Right(deleteUser);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
