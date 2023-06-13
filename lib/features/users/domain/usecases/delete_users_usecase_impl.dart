import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteUsersUseCaseImpl implements UseCase<UserEntity, void> {
  UserRepository repository;

  DeleteUsersUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(UserEntity params) {
    return repository.deleteUser(params);
  }
}
