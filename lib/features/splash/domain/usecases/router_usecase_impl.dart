import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:alertifyapp/core/failure/failure.dart';

class RouterUseCaseImpl implements UseCase<NoParams, dynamic> {
  SplashRepository repository;

  RouterUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.router();
  }
}
