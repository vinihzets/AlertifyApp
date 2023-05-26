import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/login/data/datasources/login_datasources.dart';
import 'package:alertifyapp/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSources dataSources;

  LoginRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, String>> signIn(SignInParams params) async {
    try {
      final signInRequest = await dataSources.signIn(params);

      return Right(signInRequest);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
