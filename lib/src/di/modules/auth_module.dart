import 'package:injectable/injectable.dart';
import 'package:sirkel/src/data/repo/auth_repository.dart';
import 'package:sirkel/src/data/repo/auth_repository_impl.dart';
import 'package:sirkel/src/domain/usecases/login_usecase.dart';

@module
abstract class AuthModule {
  @Injectable(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  LoginUseCase loginUseCase(AuthRepository authRepository) {
    return LoginUseCase(authRepository);
  }
}
