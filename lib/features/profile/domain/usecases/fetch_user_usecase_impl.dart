import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/core/global/entities/user_entity.dart';
import 'package:alertifyapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:alertifyapp/features/users/domain/usecases/fetch_users_usecase_impl.dart';
import 'package:dartz/dartz.dart';

class FetchUserUseCaseImpl implements UseCase<NoParams, UserEntity> {
  ProfileRepository repository;

  FetchUserUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return repository.fetchUser();
  }
}
