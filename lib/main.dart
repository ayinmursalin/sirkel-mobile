import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sirkel/app_supabase.dart';
import 'package:sirkel/src/utils/date_time_util.dart';
import 'package:sirkel/my_app.dart';
import 'package:sirkel/src/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await initializeDateFormatting(DateTimeUtil.locale, null);
  await AppSupabase.init();

  runApp(const MyApp());
}
