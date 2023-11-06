import 'package:dio/dio.dart';
import 'package:networks/core/domain/models/model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

// TODO(any): change when build server
@RestApi(baseUrl: 'http://localhost:3000/')
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;
  @GET('/user-scope')
  Future<HttpResponse<List<UserPoint>?>> userPoints();
}
