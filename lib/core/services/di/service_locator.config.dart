// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../pages/app/cubit/app_cubit.dart' as _i10;
import '../../../pages/home/cubits/home/home_cubit.dart' as _i12;
import '../../../pages/home/cubits/location/location_cubit.dart' as _i9;
import '../../domain/data/local_data_sources/local_data_sources.dart' as _i3;
import '../../domain/data/remote_data_sources/remote_data_sources.dart' as _i4;
import '../../domain/domain.dart' as _i8;
import '../../domain/networks/api_client.dart' as _i5;
import '../../domain/repositories/repositories.dart' as _i6;
import '../../domain/use_cases/use_cases.dart' as _i7;
import '../share_preferences/share_preferences_helper.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.HomeLocalDataSource>(() => _i3.HomeLocalDataSource());
  gh.factory<_i4.HomeRemoteDataSource>(
      () => _i4.HomeRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i6.HomeRepository>(() => _i6.HomeRepository.create(
        gh<_i4.HomeRemoteDataSource>(),
        gh<_i3.HomeLocalDataSource>(),
      ));
  gh.factory<_i7.HomeUseCase>(() => _i7.HomeUseCase(gh<_i8.HomeRepository>()));
  gh.factory<_i9.LocationCubit>(() => _i9.LocationCubit());
  gh.factory<_i10.AppCubit>(() => _i10.AppCubit(
        gh<_i11.SharedPreferencesHelper>(),
        gh<_i8.HomeUseCase>(),
      ));
  gh.factory<_i12.HomeCubit>(() => _i12.HomeCubit(gh<_i9.LocationCubit>()));
  return getIt;
}
