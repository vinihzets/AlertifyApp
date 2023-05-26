import 'package:alertifyapp/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NotActiveRepository {
  Future<Either<Failure, void>> signOut();
}
