// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'auth/application/code/code_bloc.dart' as _i3;
import 'auth/application/password/password_bloc.dart' as _i7;
import 'auth/application/phone_number/phone_number_bloc.dart' as _i8;
import 'auth/infrastructure/di/app_injectable_module.dart' as _i9;
import 'auth/infrastructure/i_local_storage.dart' as _i5;
import 'auth/infrastructure/local_storage.dart' as _i6;
import 'auth/infrastructure/sembast_database.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appInjectableModule = _$AppInjectableModule();
  gh.factory<_i3.CodeBloc>(() => _i3.CodeBloc());
  gh.lazySingleton<_i4.SembastDatabase>(() => appInjectableModule.sembastDb);
  gh.lazySingleton<_i5.ILocalStorage>(
      () => _i6.LocalStorage(get<_i4.SembastDatabase>()));
  gh.factory<_i7.PasswordBloc>(
      () => _i7.PasswordBloc(get<_i5.ILocalStorage>()));
  gh.factory<_i8.PhoneNumberBloc>(
      () => _i8.PhoneNumberBloc(get<_i5.ILocalStorage>()));
  return get;
}

class _$AppInjectableModule extends _i9.AppInjectableModule {}
