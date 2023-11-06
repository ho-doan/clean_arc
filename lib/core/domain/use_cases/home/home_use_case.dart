part of '../use_cases.dart';

class HomeUseCase {
  HomeUseCase(this._repository);

  final HomeRepository _repository;

  Future<Either<String, UserPoint>> userPoints(UserPoint model) async {
    return _repository.userPoints(model);
  }
}
