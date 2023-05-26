import 'package:alertifyapp/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepository {
  Future<Either<Failure, dynamic>> router();
}
