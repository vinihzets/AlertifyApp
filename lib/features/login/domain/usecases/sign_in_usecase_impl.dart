import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:alertifyapp/core/failure/failure.dart';

import '../repositories/login_repository.dart';

class SignInUseCaseImpl implements UseCase<SignInParams, String> {
  LoginRepository repository;

  SignInUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, String>> call(SignInParams params) {
    return repository.signIn(params);
  }
}
