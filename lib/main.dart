import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'firebase_options.dart';
import 'core/themes/app_theme.dart';
import 'core/providers/app_providers.dart';
import 'core/providers/theme_provider.dart';
import 'core/providers/language_provider.dart';
import 'core/routing/app_router.dart';
import 'l10n/app_localizations.dart';
import 'shared/services/local_storage_service.dart';
import 'shared/services/notification_service.dart';
import 'shared/services/firebase_messaging_service.dart';
import 'shared/services/reminder_service.dart';

void main() async {
  await runZonedGuarded(() async {
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

    // Initialize Crashlytics
    if (!kDebugMode) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
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

  // Initialize ReminderService and schedule daily reminders
  final reminderService = ReminderService(
    notificationService: notificationService,
    storageService: localStorageService,
  );
  try {
    await reminderService.checkAndScheduleDaily();
  } catch (e) {
    debugPrint('ReminderService daily schedule check failed: $e');
  }

  final sharedPreferences = await SharedPreferences.getInstance();

    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          localStorageServiceProvider.overrideWithValue(localStorageService),
        ],
        child: const AqualertApp(),
      ),
    );
  }, (error, stack) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
  });
}

class AqualertApp extends ConsumerWidget {
  const AqualertApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final themeVariant = ref.watch(premiumThemeVariantProvider);

    return MaterialApp.router(
      title: 'Aqualert',
      theme: AppTheme.lightThemeForVariant(themeVariant),
      darkTheme: AppTheme.darkThemeForVariant(themeVariant),
      themeMode: themeMode,
      locale: locale,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English (default)
        Locale('tr'), // Turkish
        Locale('es'), // Spanish
        Locale('fr'), // French
        Locale('de'), // German
        Locale('it'), // Italian
        Locale('pt'), // Portuguese
        Locale('ru'), // Russian
        Locale('ja'), // Japanese
        Locale('ko'), // Korean
        Locale('zh'), // Chinese
        Locale('ar'), // Arabic
        Locale('hi'), // Hindi
        Locale('nl'), // Dutch
        Locale('pl'), // Polish
      ],
    );
  }
}