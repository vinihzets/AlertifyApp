import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/features/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCaseImpl implements UseCase<RegisterParams, UserCredential> {
  RegisterRepository repository;

  SignUpUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(RegisterParams params) {
    return repository.signUp(params);
  }
}
