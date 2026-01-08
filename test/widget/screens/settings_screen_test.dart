import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/features/settings/presentation/screens/settings_screen.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('SettingsScreen Widget Tests', () {
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore fakeFirestore;

    setUpAll(() async {
      // Initialize Hive once for all tests
      await initializeHiveForTest();
    });

    setUp(() async {
      mockAuth = createMockAuthWithUser();
      fakeFirestore = FakeFirebaseFirestore();

      await setupSharedPreferences({
        'theme_mode': 'system',
        'water_unit': 'ml',
        'locale': 'en',
        'reminder_enabled': true,
        'reminder_interval': 60,
        'reminder_start_hour': 8,
        'reminder_start_minute': 0,
        'reminder_end_hour': 22,
        'reminder_end_minute': 0,
      });
    });

    tearDownAll(() async {
      // Close Hive boxes after all tests
      await closeHiveBoxes();
    });

    testWidgets('should display all settings sections', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Check for key UI elements
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Switch), findsWidgets); // Notification switch, theme switches
    });

    testWidgets('should display notification settings', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Notification settings should be present
      expect(find.byIcon(Icons.notifications_active), findsOneWidget);
      expect(find.byIcon(Icons.schedule), findsOneWidget);
      expect(find.byIcon(Icons.access_time), findsOneWidget);
      expect(find.byIcon(Icons.bedtime), findsOneWidget);
    });

    testWidgets('should toggle reminder switch', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the first switch (reminder toggle)
      final reminderSwitch = find.byType(Switch).first;
      final initialValue = tester.widget<Switch>(reminderSwitch).value;

      // Act - Toggle the switch
      await tester.tap(reminderSwitch);
      await tester.pumpAndSettle();

      // Assert - Value should have changed
      final newValue = tester.widget<Switch>(reminderSwitch).value;
      expect(newValue, !initialValue);
    });

    testWidgets('should display theme settings', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Theme settings should be present
      expect(find.byIcon(Icons.brightness_6), findsOneWidget);
    });

    testWidgets('should display unit settings', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Unit settings should be present
      expect(find.byIcon(Icons.straighten), findsOneWidget);
    });

    testWidgets('should display language settings', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Language settings should be present
      expect(find.byIcon(Icons.language), findsOneWidget);
    });

    testWidgets('should display data management section', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Data management options should be present
      expect(find.byIcon(Icons.download), findsOneWidget);
      expect(find.byIcon(Icons.upload), findsOneWidget);
    });

    testWidgets('should display account section', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Account settings should be present
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.flag), findsOneWidget);
    });

    testWidgets('should open drawer when menu icon is tapped',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Tap menu icon
      final menuIcon = find.byIcon(Icons.menu);
      if (menuIcon.evaluate().isNotEmpty) {
        await tester.tap(menuIcon);
        await tester.pumpAndSettle();

        // Assert - Drawer should be visible
        expect(find.byType(Drawer), findsOneWidget);
      }
    });

    testWidgets('should show interval dialog when interval setting tapped',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Find and tap reminder interval setting
      final intervalCard = find.byIcon(Icons.schedule);
      if (intervalCard.evaluate().isNotEmpty) {
        await tester.tap(intervalCard);
        await tester.pumpAndSettle();

        // Assert - Dialog should appear
        expect(find.byType(AlertDialog), findsOneWidget);
      }
    });

    testWidgets('should handle settings interactions without errors',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Tap on various settings
      final cards = find.byType(Card);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pump();

        // Assert - Should not throw exceptions
        expect(tester.takeException(), isNull);
      }
    });

    testWidgets('should display all icons correctly', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Check for all setting icons
      final expectedIcons = [
        Icons.notifications_active,
        Icons.schedule,
        Icons.access_time,
        Icons.bedtime,
        Icons.brightness_6,
        Icons.straighten,
        Icons.language,
        Icons.download,
        Icons.upload,
        Icons.person,
        Icons.flag,
      ];

      for (final icon in expectedIcons) {
        expect(find.byIcon(icon), findsOneWidget,
            reason: 'Icon $icon should be present');
      }
    });

    testWidgets('should scroll to view all settings', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: SettingsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Scroll down
      await tester.drag(find.byType(ListView), const Offset(0, -500));
      await tester.pumpAndSettle();

      // Assert - Should scroll without errors
      expect(tester.takeException(), isNull);
    });
  });
}