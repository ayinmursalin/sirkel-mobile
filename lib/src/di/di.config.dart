// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:sirkel/src/data/local/app_preferences.dart' as _i4;
import 'package:sirkel/src/data/repo/auth_repository.dart' as _i5;
import 'package:sirkel/src/data/repo/auth_repository_impl.dart' as _i9;
import 'package:sirkel/src/di/modules/auth_module.dart' as _i8;
import 'package:sirkel/src/di/modules/local_module.dart' as _i7;
import 'package:sirkel/src/domain/usecases/login_usecase.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    final authModule = _$AuthModule();
    await gh.singletonAsync<_i3.SharedPreferences>(
      () => localModule.prefs(),
      preResolve: true,
    );
    gh.singleton<_i4.AppPreferences>(
        () => localModule.appPreferences(gh<_i3.SharedPreferences>()));
    gh.factory<_i5.AuthRepository>(() => authModule.authRepository);
    gh.factory<_i6.LoginUseCase>(
        () => authModule.loginUseCase(gh<_i5.AuthRepository>()));
    return this;
  }
}

class _$LocalModule extends _i7.LocalModule {}

class _$AuthModule extends _i8.AuthModule {
  @override
  _i9.AuthRepositoryImpl get authRepository => _i9.AuthRepositoryImpl();
}
