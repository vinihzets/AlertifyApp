import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ActivateUserUseCaseImpl implements UseCase<ActivateUserParams, dynamic> {
  UserRepository repository;

  ActivateUserUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(ActivateUserParams params) {
    return repository.activate(params);
  }
}
