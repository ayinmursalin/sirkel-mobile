import 'package:sirkel/env.dart';
import 'package:sirkel/src/data/local/app_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSupabase {
  static Future init() async {
    await Supabase.initialize(
      url: Env.url,
      anonKey: Env.apiKey,
      storageOptions: const StorageClientOptions(
        retryAttempts: 10,
      ),
      authOptions: const FlutterAuthClientOptions(
        localStorage: AppStorage(),
      ),
    );
  }
}
