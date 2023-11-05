part of '../repositories.dart';

@injectable
abstract class HomeRepository {
  @factoryMethod
  static HomeRepositoryImlp create(
    HomeRemoteDataSource remoteDataSource,
    HomeLocalDataSource localDataSource,
  ) =>
      HomeRepositoryImlp(
        remoteDataSource,
        localDataSource,
      );

  Future<Either<String, List<UserPoint>>> userPoints();
}

class HomeRepositoryImlp extends HomeRepository {
  HomeRepositoryImlp(
    this._remoteDS,
    this._localDS,
  );

  // ignore: unused_field
  final HomeLocalDataSource _localDS;
  final HomeRemoteDataSource _remoteDS;

  @override
  Future<Either<String, List<UserPoint>>> userPoints() =>
      _remoteDS.userPoints();
}
