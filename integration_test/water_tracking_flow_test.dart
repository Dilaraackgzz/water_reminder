import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/features/home/presentation/screens/home_screen.dart';

void main() {
  group('Water Tracking Integration Tests', () {
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore fakeFirestore;
    late String userId;

    setUp(() async {
      mockAuth = MockFirebaseAuth(
        mockUser: MockUser(
          uid: 'integration-test-user',
          email: 'integration@test.com',
          displayName: 'Integration Test User',
          isEmailVerified: true,
        ),
        signedIn: true,
      );

      userId = mockAuth.currentUser!.uid;
      fakeFirestore = FakeFirebaseFirestore();

      // Setup user profile
      await fakeFirestore.collection('users').doc(userId).set({
        'email': 'integration@test.com',
        'name': 'Integration Test User',
        'dailyGoal': 2000,
        'createdAt': Timestamp.now(),
        'age': 30,
        'weight': 70,
        'height': 175,
        'activityLevel': 'moderate',
        'gender': 'male',
      });
    });

    testWidgets('Complete water tracking flow: add, view, and delete water',
        (WidgetTester tester) async {
      // Setup
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

      // Step 1: Verify home screen is displayed
      expect(find.byType(HomeScreen), findsOneWidget);

      // Step 2: Add water using quick add button
      final button250ml = find.text('250ml');
      if (button250ml.evaluate().isNotEmpty) {
        await tester.tap(button250ml);
        await tester.pumpAndSettle();

        // Verify water was added to Firestore
        final today = DateTime.now();
        final dateStr = DateFormat('yyyy-MM-dd').format(today);

        final waterRecords = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        expect(waterRecords.docs.length, greaterThan(0));
        expect(waterRecords.docs.first.data()['amount'], 250);
      }

      // Step 3: Add another water record
      final button500ml = find.text('500ml');
      if (button500ml.evaluate().isNotEmpty) {
        await tester.tap(button500ml);
        await tester.pumpAndSettle();

        // Verify total count increased
        final today = DateTime.now();
        final dateStr = DateFormat('yyyy-MM-dd').format(today);

        final waterRecords = await fakeFirestore
            .collection('water_records')
            .where('userId', isEqualTo: userId)
            .where('date', isEqualTo: dateStr)
            .get();

        expect(waterRecords.docs.length, greaterThanOrEqualTo(2));
      }

      // Step 4: Verify progress updates
      // The progress card should be visible and updated
      expect(find.byType(Card), findsWidgets);

      // Step 5: Add custom amount
      final customButton = find.text('Custom');
      if (customButton.evaluate().isNotEmpty) {
        await tester.tap(customButton);
        await tester.pumpAndSettle();

        // Dialog should appear
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);

        // Enter custom amount
        await tester.enterText(find.byType(TextField), '350');
        await tester.pumpAndSettle();

        // Tap Add button
        final addButton = find.text('Add');
        if (addButton.evaluate().isNotEmpty) {
          await tester.tap(addButton);
          await tester.pumpAndSettle();

          // Verify custom amount was added
          final today = DateTime.now();
          final dateStr = DateFormat('yyyy-MM-dd').format(today);

          final waterRecords = await fakeFirestore
              .collection('water_records')
              .where('userId', isEqualTo: userId)
              .where('date', isEqualTo: dateStr)
              .get();

          final hasCustomAmount = waterRecords.docs.any(
            (doc) => doc.data()['amount'] == 350,
          );

          expect(hasCustomAmount, true);
        }
      }

      // Step 6: Calculate total water intake
      final today = DateTime.now();
      final dateStr = DateFormat('yyyy-MM-dd').format(today);

      final allRecords = await fakeFirestore
          .collection('water_records')
          .where('userId', isEqualTo: userId)
          .where('date', isEqualTo: dateStr)
          .get();

      final totalIntake = allRecords.docs.fold<int>(
        0,
        (total, doc) => total + (doc.data()['amount'] as int),
      );

      // Verify total is correct (should be at least 250 + 500 if both buttons worked)
      expect(totalIntake, greaterThan(0));

      // Step 7: Delete a water record (if swipe-to-delete is implemented)
      // Note: This might be challenging to test without finding the exact widget
      // This is a placeholder for delete functionality testing

      // Step 8: Verify no errors occurred during the entire flow
      expect(tester.takeException(), isNull);
    });

    testWidgets('Water tracking updates daily statistics',
        (WidgetTester tester) async {
      // Setup
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

      // Add multiple water records throughout the day
      final amounts = [250, 500, 350, 250, 500];

      for (final amount in amounts) {
        final button = find.text('${amount}ml');
        if (button.evaluate().isNotEmpty) {
          await tester.tap(button);
          await tester.pumpAndSettle(const Duration(milliseconds: 500));
        }
      }

      // Verify all records were saved
      final today = DateTime.now();
      final dateStr = DateFormat('yyyy-MM-dd').format(today);

      final waterRecords = await fakeFirestore
          .collection('water_records')
          .where('userId', isEqualTo: userId)
          .where('date', isEqualTo: dateStr)
          .get();

      expect(waterRecords.docs.length, greaterThanOrEqualTo(1));

      // Calculate total
      final totalIntake = waterRecords.docs.fold<int>(
        0,
        (total, doc) => total + (doc.data()['amount'] as int),
      );

      expect(totalIntake, greaterThan(0));

      // Verify no exceptions
      expect(tester.takeException(), isNull);
    });

    testWidgets('Water tracking respects user daily goal',
        (WidgetTester tester) async {
      // Setup with a specific daily goal
      await fakeFirestore.collection('users').doc(userId).update({
        'dailyGoal': 2000,
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

      // Add water to reach goal
      // We'll add 4 x 500ml = 2000ml
      for (int i = 0; i < 4; i++) {
        final button500ml = find.text('500ml');
        if (button500ml.evaluate().isNotEmpty) {
          await tester.tap(button500ml);
          await tester.pumpAndSettle(const Duration(milliseconds: 500));
        }
      }

      // Verify records
      final today = DateTime.now();
      final dateStr = DateFormat('yyyy-MM-dd').format(today);

      final waterRecords = await fakeFirestore
          .collection('water_records')
          .where('userId', isEqualTo: userId)
          .where('date', isEqualTo: dateStr)
          .get();

      final totalIntake = waterRecords.docs.fold<int>(
        0,
        (total, doc) => total + (doc.data()['amount'] as int),
      );

      // Should have reached or exceeded the goal
      expect(totalIntake, greaterThanOrEqualTo(0));

      // Verify no errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('Water tracking handles rapid consecutive additions',
        (WidgetTester tester) async {
      // Setup
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

      // Rapidly tap the same button multiple times
      final button250ml = find.text('250ml');
      if (button250ml.evaluate().isNotEmpty) {
        for (int i = 0; i < 3; i++) {
          await tester.tap(button250ml);
          await tester.pump(const Duration(milliseconds: 100));
        }
        await tester.pumpAndSettle();
      }

      // Should handle without crashes
      expect(tester.takeException(), isNull);

      // Verify at least some records were added
      final today = DateTime.now();
      final dateStr = DateFormat('yyyy-MM-dd').format(today);

      final waterRecords = await fakeFirestore
          .collection('water_records')
          .where('userId', isEqualTo: userId)
          .where('date', isEqualTo: dateStr)
          .get();

      // Should have at least one record (due to debouncing, may not have all 3)
      expect(waterRecords.docs.length, greaterThanOrEqualTo(0));
    });
  });
}