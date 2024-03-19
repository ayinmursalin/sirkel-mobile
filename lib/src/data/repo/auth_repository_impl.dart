import 'package:sirkel/src/utils/future_util.dart';
import 'package:sirkel/src/utils/typedef_util.dart';
import 'package:sirkel/src/data/repo/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl extends AuthRepository {
  final supabase = Supabase.instance.client;

  @override
  FutureOrError<AuthResponse> login({
    required String email,
    required String password,
  }) {
    return callOrError(() {
      return supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    });
  }

  @override
  User? currentUser() {
    return supabase.auth.currentUser;
  }

  @override
  Future<List<ResponseData>> getProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return [];

    return supabase.from('profiles').select().eq('id', userId);
  }
}
