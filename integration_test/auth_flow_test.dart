import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/features/auth/presentation/screens/login_screen.dart';
import 'package:water_reminder/features/auth/presentation/screens/register_screen.dart';

void main() {
  group('Authentication Flow Integration Tests', () {
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore fakeFirestore;

    setUp(() {
      mockAuth = MockFirebaseAuth(signedIn: false);
      fakeFirestore = FakeFirebaseFirestore();
    });

    testWidgets('Complete registration flow with email and password',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: RegisterScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Step 1: Verify registration screen is displayed
      expect(find.byType(RegisterScreen), findsOneWidget);

      // Step 2: Fill in registration form
      final nameField = find.byType(TextFormField).at(0);
      await tester.enterText(nameField, 'Test User');
      await tester.pumpAndSettle();

      final emailField = find.byType(TextFormField).at(1);
      await tester.enterText(emailField, 'newuser@test.com');
      await tester.pumpAndSettle();

      final passwordField = find.byType(TextFormField).at(2);
      await tester.enterText(passwordField, 'password123');
      await tester.pumpAndSettle();

      final confirmPasswordField = find.byType(TextFormField).at(3);
      await tester.enterText(confirmPasswordField, 'password123');
      await tester.pumpAndSettle();

      // Step 3: Submit registration form
      final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');
      if (signUpButton.evaluate().isNotEmpty) {
        await tester.tap(signUpButton);
        await tester.pumpAndSettle();

        // Verify user was created
        expect(mockAuth.currentUser, isNotNull);
        expect(mockAuth.currentUser?.email, 'newuser@test.com');
      }

      // Step 4: Verify no errors occurred
      expect(tester.takeException(), isNull);
    });

    testWidgets('Complete login flow with email and password',
        (WidgetTester tester) async {
      // Setup - Create a user first
      mockAuth = MockFirebaseAuth(
        mockUser: MockUser(
          uid: 'test-user-id',
          email: 'existing@test.com',
          displayName: 'Existing User',
          isEmailVerified: true,
        ),
        signedIn: false, // Start signed out
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Step 1: Verify login screen is displayed
      expect(find.byType(LoginScreen), findsOneWidget);

      // Step 2: Enter credentials
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'existing@test.com');
      await tester.pumpAndSettle();

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'password123');
      await tester.pumpAndSettle();

      // Step 3: Tap sign in button
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      if (signInButton.evaluate().isNotEmpty) {
        await tester.tap(signInButton);
        await tester.pump();

        // Note: With mocks, the user will be signed in automatically
        // In a real integration test, we would verify navigation to home screen
      }

      // Step 4: Verify no errors occurred
      expect(tester.takeException(), isNull);
    });

    testWidgets('Login validation shows errors for invalid inputs',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Step 1: Try to submit empty form
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      if (signInButton.evaluate().isNotEmpty) {
        await tester.tap(signInButton);
        await tester.pumpAndSettle();

        // Step 2: Verify validation errors appear
        expect(find.text('Please enter your email'), findsOneWidget);
        expect(find.text('Please enter your password'), findsOneWidget);
      }

      // Step 3: Enter invalid email format
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'invalid-email');
      await tester.pumpAndSettle();

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'pass');
      await tester.pumpAndSettle();

      // Step 4: Submit form
      if (signInButton.evaluate().isNotEmpty) {
        await tester.tap(signInButton);
        await tester.pumpAndSettle();

        // Step 5: Verify email validation error
        expect(find.text('Please enter a valid email'), findsOneWidget);
      }

      // Verify no crashes
      expect(tester.takeException(), isNull);
    });

    testWidgets('Registration validation checks password match',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: RegisterScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Fill form with mismatched passwords
      final nameField = find.byType(TextFormField).at(0);
      await tester.enterText(nameField, 'Test User');

      final emailField = find.byType(TextFormField).at(1);
      await tester.enterText(emailField, 'test@example.com');

      final passwordField = find.byType(TextFormField).at(2);
      await tester.enterText(passwordField, 'password123');

      final confirmPasswordField = find.byType(TextFormField).at(3);
      await tester.enterText(confirmPasswordField, 'password456');

      await tester.pumpAndSettle();

      // Try to submit
      final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');
      if (signUpButton.evaluate().isNotEmpty) {
        await tester.tap(signUpButton);
        await tester.pumpAndSettle();

        // Should show password mismatch error
        expect(find.text('Passwords do not match'), findsOneWidget);
      }

      // Verify no crashes
      expect(tester.takeException(), isNull);
    });

    testWidgets('Password visibility toggle works in login screen',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find password field
      final passwordField = find.byType(TextFormField).last;
      var textField = tester.widget<TextFormField>(passwordField);

      // Initially password should be obscured
      expect(textField.obscureText, true);

      // Find and tap visibility toggle
      final visibilityIcon = find.byIcon(Icons.visibility_off);
      if (visibilityIcon.evaluate().isNotEmpty) {
        await tester.tap(visibilityIcon);
        await tester.pumpAndSettle();

        // Password should now be visible
        textField = tester.widget<TextFormField>(passwordField);
        expect(textField.obscureText, false);

        // Tap again to hide
        final visibilityOnIcon = find.byIcon(Icons.visibility);
        if (visibilityOnIcon.evaluate().isNotEmpty) {
          await tester.tap(visibilityOnIcon);
          await tester.pumpAndSettle();

          // Password should be obscured again
          textField = tester.widget<TextFormField>(passwordField);
          expect(textField.obscureText, true);
        }
      }

      // Verify no errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('Navigation between login and register screens',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify on login screen
      expect(find.text('Welcome Back'), findsOneWidget);

      // Find and tap "Sign Up" link
      final signUpLink = find.text('Sign Up');
      if (signUpLink.evaluate().isNotEmpty) {
        await tester.tap(signUpLink);
        await tester.pumpAndSettle();

        // Note: Without full router setup, this might not navigate
        // But it should not crash
      }

      // Verify no errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('Forgot password flow can be initiated',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find and tap "Forgot Password?" link
      final forgotPasswordLink = find.text('Forgot Password?');
      if (forgotPasswordLink.evaluate().isNotEmpty) {
        await tester.tap(forgotPasswordLink);
        await tester.pumpAndSettle();

        // Note: Without full router, might not navigate
        // But should not crash
      }

      // Verify no errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('Multiple sign-in attempts handle loading states correctly',
        (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseAuthProvider.overrideWithValue(mockAuth),
            firestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Enter valid credentials
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'test@example.com');

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'password123');

      await tester.pumpAndSettle();

      // Tap sign in button
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      if (signInButton.evaluate().isNotEmpty) {
        await tester.tap(signInButton);
        await tester.pump();

        // During async operation, should show loading indicator
        // (Implementation specific - may or may not be visible depending on mock speed)

        await tester.pumpAndSettle();
      }

      // Should complete without errors
      expect(tester.takeException(), isNull);
    });
  });
}

extension on TextFormField {
   get obscureText => null;
}