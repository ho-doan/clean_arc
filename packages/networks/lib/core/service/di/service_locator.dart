import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../domain/networks/api_client.dart';
import 'service_locator.config.dart'; // default auto gen

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
void configureDomainDependencies() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(Dio()));
  $initGetIt(getIt);
}
