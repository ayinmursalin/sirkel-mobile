import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppStorage extends LocalStorage {
  final storage = const FlutterSecureStorage();

  const AppStorage();

  @override
  Future<void> initialize() async {}

  @override
  Future<String?> accessToken() async {
    return storage.read(key: supabasePersistSessionKey);
  }

  @override
  Future<bool> hasAccessToken() async {
    return storage.containsKey(key: supabasePersistSessionKey);
  }

  @override
  Future<void> persistSession(String persistSessionString) async {
    return storage.write(
        key: supabasePersistSessionKey, value: persistSessionString);
  }

  @override
  Future<void> removePersistedSession() async {
    return storage.delete(key: supabasePersistSessionKey);
  }
}
