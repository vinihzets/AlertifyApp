import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/features/not_active/domain/repositories/not_active_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:alertifyapp/core/failure/failure.dart';

class LeaveApplicationUseCaseImpl implements UseCase<NoParams, void> {
  NotActiveRepository repository;

  LeaveApplicationUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.signOut();
  }
}
