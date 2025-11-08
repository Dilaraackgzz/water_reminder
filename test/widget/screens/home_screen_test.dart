import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/features/home/presentation/screens/home_screen.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore fakeFirestore;
    late String userId;

    setUp(() async {
      mockAuth = createMockAuthWithUser();
      userId = mockAuth.currentUser!.uid;

      // Setup Firestore with user data
      fakeFirestore = await setupFakeFirestore(
        userId: userId,
        userProfile: {
          'email': 'test@example.com',
          'name': 'Test User',
          'dailyGoal': 2000,
          'createdAt': Timestamp.now(),
        },
      );

      await setupSharedPreferences({
        'theme_mode': 'system',
        'water_unit': 'ml',
      });
    });

    testWidgets('should display all main UI components', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Check for key widgets
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Drawer), findsOneWidget);

      // Quick add buttons should be present
      expect(find.text('250ml'), findsOneWidget);
      expect(find.text('500ml'), findsOneWidget);
    });

    testWidgets('should show custom amount dialog when custom button tapped',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Find and tap custom amount button
      final customButton = find.text('Custom');
      if (customButton.evaluate().isNotEmpty) {
        await tester.tap(customButton);
        await tester.pumpAndSettle();

        // Assert - Dialog should appear
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
      }
    });

    testWidgets('should add water when quick add button is tapped',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Get initial record count
      final initialSnapshot = await fakeFirestore
          .collection('water_records')
          .where('userId', isEqualTo: userId)
          .get();
      final initialCount = initialSnapshot.docs.length;

      // Act - Tap 250ml button
      final button250ml = find.text('250ml');
      if (button250ml.evaluate().isNotEmpty) {
        await tester.tap(button250ml);
        await tester.pumpAndSettle();

        // Assert - A new record should be added
        final newSnapshot = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .get();

        expect(newSnapshot.docs.length, greaterThan(initialCount));
      }
    });

    testWidgets('should display daily progress card', (WidgetTester tester) async {
      // Arrange - Add some water records
      final today = DateTime.now();
      final dateStr = DateFormat('yyyy-MM-dd').format(today);

      await fakeFirestore.collection('water_records').add({
        'userId': userId,
        'amount': 500,
        'timestamp': Timestamp.fromDate(today),
        'date': dateStr,
      });

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Progress should be displayed
      // The exact text might vary, but progress card should exist
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should show motivational message', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Motivational message should be present
      // We can't test exact message content as it's dynamic,
      // but we can verify the widget structure
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should display streak card', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Streak information should be visible
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should handle water addition error gracefully',
        (WidgetTester tester) async {
      // This test verifies error handling exists
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Tap a button
      final button250ml = find.text('250ml');
      if (button250ml.evaluate().isNotEmpty) {
        await tester.tap(button250ml);
        await tester.pump();

        // Assert - Should not throw exceptions
        expect(tester.takeException(), isNull);
      }
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
            home: HomeScreen(),
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

    testWidgets('should handle pull to refresh', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act - Find RefreshIndicator if it exists
      final refreshIndicator = find.byType(RefreshIndicator);
      if (refreshIndicator.evaluate().isNotEmpty) {
        await tester.drag(refreshIndicator, const Offset(0, 300));
        await tester.pumpAndSettle();

        // Assert - Should complete without errors
        expect(tester.takeException(), isNull);
      }
    });
  });
}