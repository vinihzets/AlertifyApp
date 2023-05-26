import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:alertifyapp/core/failure/failure.dart';

class SignOutUseCaseImpl implements UseCase<NoParams, void> {
  HomeRepository repository;

  SignOutUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.signOut();
  }
}
