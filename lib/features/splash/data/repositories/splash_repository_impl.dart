import 'package:alertifyapp/core/failure/failure.dart';
import 'package:alertifyapp/features/splash/data/datasources/splash_datasources.dart';
import 'package:alertifyapp/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepositoryImpl implements SplashRepository {
  SplashDataSources dataSources;

  SplashRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, dynamic>> router() async {
    try {
      final route = await dataSources.router();

      return Right(route);
    } on Exception catch (_) {
      return Left(RemoteFailure(
          message: 'Nao foi possivel capturar sua rota de navegacao'));
    }
  }
}
