import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class FetchUsersUseCaseImpl implements UseCase<NoParams, List<UserEntity>> {
  UserRepository repository;

  FetchUsersUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) {
    return repository.fetchUsers();
  }
}
