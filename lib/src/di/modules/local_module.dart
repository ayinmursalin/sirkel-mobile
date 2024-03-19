import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirkel/src/data/local/app_preferences.dart';

@module
abstract class LocalModule {
  @singleton
  @preResolve
  Future<SharedPreferences> prefs() {
    return SharedPreferences.getInstance();
  }

  @singleton
  AppPreferences appPreferences(SharedPreferences prefs) {
    return AppPreferences(prefs);
  }
}
