import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'firebase_options.dart';
import 'core/themes/app_theme.dart';
import 'core/providers/app_providers.dart';
import 'shared/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  final localStorageService = LocalStorageService();
  try {
    await localStorageService.initialize();
  } catch (e) {
    debugPrint('LocalStorageService initialization failed: $e');
  }

  tz.initializeTimeZones();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        localStorageServiceProvider.overrideWithValue(localStorageService),
      ],
      child: const AquaReminderApp(),
    ),
  );
}

class AquaReminderApp extends ConsumerWidget {
  const AquaReminderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'AquaReminder',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}