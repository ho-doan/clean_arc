part of '../use_cases.dart';

class HomeUseCase {
  HomeUseCase(this._repository);

  final HomeRepository _repository;

  Future<Either<String, List<UserPoint>>> userPoints() async {
    return _repository.userPoints();
  }
}
