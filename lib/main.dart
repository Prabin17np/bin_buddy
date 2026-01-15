import 'package:bin_buddy/core/services/hive/hive_service.dart';
import 'package:bin_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bin_buddy/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bin_buddy/core/services/storage/user_session_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  final sharedPref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferenceProvider.overrideWithValue(sharedPref)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buddy App',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
