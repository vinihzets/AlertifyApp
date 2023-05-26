import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/register/data/datasources/register_datasources.dart';
import 'package:alertifyapp/features/register/domain/repositories/register_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterDataSources dataSources;

  RegisterRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, UserCredential>> signUp(RegisterParams params) async {
    try {
      final signUpRequest = await dataSources.signUp(params);

      return Right(signUpRequest);
    } on Exception catch (ex) {
      return Left(RemoteFailure(message: ex.toString()));
    }
  }
}
