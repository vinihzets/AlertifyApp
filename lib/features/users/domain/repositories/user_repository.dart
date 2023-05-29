import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> fetchUsers();
  Future<Either<Failure, dynamic>> activate(ActivateUserParams params);
  Future<Either<Failure, void>> deleteUser(UserEntity entity);
}
