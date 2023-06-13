import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:alertifyapp/core/failure/failure.dart';

class DeleteUserUseCaseImpl implements UseCase<UserEntity, dynamic> {
  ProfileRepository repository;

  DeleteUserUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(UserEntity entity) {
    return repository.deleteUser(entity);
  }
}
