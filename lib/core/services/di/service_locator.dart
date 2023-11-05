import 'package:clean_arc/core/services/share_preferences/share_preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_locator.config.dart'; // default auto gen

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
void configureDependencies(Dio dio) {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  getIt.registerFactory<SharedPreferencesHelper>(
    () => SharedPreferencesHelper(getIt<SharedPreferences>()),
  );

  // getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio));
  // configureDomainDependencies(getIt);
  $initGetIt(getIt);
}
