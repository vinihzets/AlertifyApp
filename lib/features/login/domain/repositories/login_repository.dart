import 'package:alertifyapp/core/architecture/usecase.dart';
import 'package:alertifyapp/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> signIn(SignInParams params);
}
