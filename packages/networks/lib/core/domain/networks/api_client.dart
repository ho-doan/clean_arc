import 'package:dio/dio.dart';
import 'package:networks/core/domain/models/model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;
  @GET('/user_points')
  Future<HttpResponse<List<UserPoint>?>> userPoints();
}
