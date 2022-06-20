// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/hometest/presentation/bloc/home_test_bloc.dart' as _i4;
import '../features/hometest/presentation/cubit/cart_cubit.dart' as _i3;
import 'injectable.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.CartCubit>(registerModule.cubitCubit());
  gh.singleton<_i4.HomeTestBloc>(registerModule.homeTestBloc());
  return get;
}

class _$RegisterModule extends _i5.RegisterModule {}
