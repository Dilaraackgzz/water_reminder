import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:water_reminder/main.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/shared/services/local_storage_service.dart';

void main() {
  testWidgets('App starts without errors', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();
    final localStorageService = LocalStorageService();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPrefs),
          localStorageServiceProvider.overrideWithValue(localStorageService),
        ],
        child: const AqualertApp(),
      ),
    );

    // Verify that the app renders without throwing an exception
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}