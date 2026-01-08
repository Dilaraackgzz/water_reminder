import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/shared/services/local_storage_service.dart';
import 'package:water_reminder/l10n/app_localizations.dart';

/// Initialize Hive for testing
Future<void> initializeHiveForTest() async {
  // Use in-memory Hive for tests (no path needed)
  // This avoids the need for path_provider plugin in tests
  Hive.init(null);
}

/// Close all Hive boxes after tests
Future<void> closeHiveBoxes() async {
  await Hive.close();
}

/// Creates a test ProviderScope with all necessary overrides
Widget createTestApp({
  required Widget child,
  List<Override> overrides = const [],
  MockFirebaseAuth? mockAuth,
  FakeFirebaseFirestore? mockFirestore,
  SharedPreferences? sharedPreferences,
}) {
  final auth = mockAuth ?? MockFirebaseAuth();
  final firestore = mockFirestore ?? FakeFirebaseFirestore();
  final prefs = sharedPreferences;

  // Create a mock LocalStorageService
  final localStorageService = LocalStorageService();

  final defaultOverrides = <Override>[
    firebaseAuthProvider.overrideWithValue(auth),
    firestoreProvider.overrideWithValue(firestore),
    localStorageServiceProvider.overrideWithValue(localStorageService),
  ];

  // Add SharedPreferences override if provided
  if (prefs != null) {
    defaultOverrides.add(sharedPreferencesProvider.overrideWithValue(prefs));
  }

  return ProviderScope(
    overrides: [
      ...defaultOverrides,
      ...overrides,
    ],
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    ),
  );
}

/// Creates a mock authenticated user
MockUser createMockUser({
  String uid = 'test-user-id',
  String email = 'test@example.com',
  String displayName = 'Test User',
  bool isEmailVerified = true,
}) {
  return MockUser(
    uid: uid,
    email: email,
    displayName: displayName,
    isEmailVerified: isEmailVerified,
  );
}

/// Creates a mock Firebase Auth instance with a signed-in user
MockFirebaseAuth createMockAuthWithUser({
  String uid = 'test-user-id',
  String email = 'test@example.com',
  bool isEmailVerified = true,
}) {
  final user = createMockUser(
    uid: uid,
    email: email,
    isEmailVerified: isEmailVerified,
  );
  return MockFirebaseAuth(mockUser: user, signedIn: true);
}

/// Sets up fake Firestore with test data
Future<FakeFirebaseFirestore> setupFakeFirestore({
  required String userId,
  List<Map<String, dynamic>>? waterRecords,
  Map<String, dynamic>? userProfile,
  List<Map<String, dynamic>>? dailyGoals,
}) async {
  final firestore = FakeFirebaseFirestore();

  // Add user profile
  if (userProfile != null) {
    await firestore.collection('users').doc(userId).set(userProfile);
  }

  // Add water records
  if (waterRecords != null) {
    for (final record in waterRecords) {
      await firestore.collection('water_records').add({
        'userId': userId,
        ...record,
      });
    }
  }

  // Add daily goals
  if (dailyGoals != null) {
    for (final goal in dailyGoals) {
      await firestore.collection('daily_goals').add({
        'userId': userId,
        ...goal,
      });
    }
  }

  return firestore;
}

/// Initialize SharedPreferences for testing
Future<SharedPreferences> setupSharedPreferences([Map<String, Object>? values]) async {
  SharedPreferences.setMockInitialValues(values ?? {});
  return await SharedPreferences.getInstance();
}

/// Pump and settle with a timeout
Future<void> pumpAndSettleWithTimeout(
  WidgetTester tester, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  await tester.pumpAndSettle(timeout);
}

/// Wait for a specific widget to appear
Future<void> waitForWidget(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  final endTime = DateTime.now().add(timeout);

  while (DateTime.now().isBefore(endTime)) {
    await tester.pump(const Duration(milliseconds: 100));

    if (finder.evaluate().isNotEmpty) {
      return;
    }
  }

  throw TimeoutException('Widget not found: $finder', timeout);
}

class TimeoutException implements Exception {
  final String message;
  final Duration timeout;

  TimeoutException(this.message, this.timeout);

  @override
  String toString() => 'TimeoutException: $message (timeout: $timeout)';
}
