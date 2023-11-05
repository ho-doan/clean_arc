// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../pages/app/cubit/app_cubit.dart' as _i3;
import '../../../pages/home/cubits/home/home_cubit.dart' as _i6;
import '../../../pages/home/cubits/location/location_cubit.dart' as _i5;
import '../share_preferences/share_preferences_helper.dart' as _i4;

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
  gh.factory<_i3.AppCubit>(
      () => _i3.AppCubit(gh<_i4.SharedPreferencesHelper>()));
  gh.factory<_i5.LocationCubit>(() => _i5.LocationCubit());
  gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit(gh<_i5.LocationCubit>()));
  return getIt;
}
