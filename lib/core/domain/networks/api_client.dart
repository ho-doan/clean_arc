import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/model.dart';
part 'api_client.g.dart';

// TODO(any): change when build server
@RestApi(baseUrl: 'http://localhost:3000/')
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;
  @POST('/user-scope')
  Future<HttpResponse<UserPoint?>> userPoints(
      @Body() Map<String, dynamic> body);
}
