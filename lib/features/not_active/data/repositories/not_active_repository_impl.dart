import 'package:alertifyapp/features/not_active/data/datasources/not_active_datasources.dart';
import 'package:dartz/dartz.dart';

import 'package:alertifyapp/core/failure/failure.dart';

import '../../domain/repositories/not_active_repository.dart';

class NotActiveRepositoryImpl implements NotActiveRepository {
  NotActiveDataSources dataSources;

  NotActiveRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await dataSources.signOut());
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
