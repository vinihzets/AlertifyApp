import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> fetchUser();
  Future<Either<Failure, dynamic>> deleteUser(UserEntity entity);
}
