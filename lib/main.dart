import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'firebase_options.dart';
import 'core/themes/app_theme.dart';
import 'core/providers/app_providers.dart';
import 'core/providers/theme_provider.dart';
import 'core/routing/app_router.dart';
import 'shared/services/local_storage_service.dart';
import 'shared/services/notification_service.dart';
import 'shared/services/firebase_messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase - check if already initialized
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // Firebase already initialized during hot reload
    if (e.toString().contains('duplicate-app')) {
      debugPrint('Firebase already initialized');
    } else {
      rethrow;
    }
  }

  await Hive.initFlutter();

  final localStorageService = LocalStorageService();
  try {
    await localStorageService.initialize();
  } catch (e) {
    debugPrint('LocalStorageService initialization failed: $e');
  }

  tz.initializeTimeZones();

  // Initialize NotificationService
  final notificationService = NotificationService();
  try {
    await notificationService.initialize();
  } catch (e) {
    debugPrint('NotificationService initialization failed: $e');
  }

  // Initialize Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  final firebaseMessagingService = FirebaseMessagingService();
  try {
    await firebaseMessagingService.initialize();
  } catch (e) {
    debugPrint('FirebaseMessagingService initialization failed: $e');
  }

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
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'AquaReminder',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}