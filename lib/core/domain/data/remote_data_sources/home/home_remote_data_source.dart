part of '../remote_data_sources.dart';

class HomeRemoteDataSource {
  HomeRemoteDataSource(this._apiClient);
  final ApiClient _apiClient;

  Future<Either<String, UserPoint>> userPoints(UserPoint model) async {
    try {
      final result = await _apiClient.userPoints(model.toJson());
      if (result.response.statusCode == 201) {
        if (result.data != null) {
          return Right(result.data!);
        } else {
          return const Left('userPoints null data');
        }
      }
      return Left(result.response.statusMessage ?? 'fail to post userPoints');
    } catch (e) {
      if (e is DioException) {
        return Left('${e.error}');
      }
      if (e is FormatException) {
        return Left(e.message);
      }
      if (e is JsonUnsupportedObjectError) {
        return Left(e.partialResult ?? e.toString());
      }
      return Left(e.toString());
    }
  }
}
