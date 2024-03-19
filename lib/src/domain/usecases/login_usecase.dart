import 'package:either_dart/either.dart';
import 'package:sirkel/src/data/repo/auth_repository.dart';
import 'package:sirkel/src/domain/models/error_dto.dart';
import 'package:sirkel/src/domain/models/error_type.dart';
import 'package:sirkel/src/domain/models/user_dto.dart';
import 'package:sirkel/src/utils/typedef_util.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  FutureOrError<UserDto> execute(String email, String password) async {
    final result = await _authRepository.login(
      email: email,
      password: password,
    );
    if (result.isLeft) {
      return Left(result.left);
    }

    final profile = await _authRepository.getProfile();
    if (profile.isEmpty) {
      return Left(ErrorDto(
        message: 'Harap Lengkapi Akun terlebih dahulu',
        errorType: ErrorType.profileNotFound,
      ));
    }

    final data = profile.first;
    // Add Email
    data['email'] = _authRepository.currentUser()?.email;

    return Right(UserDto.fromMap(data));
  }
}
