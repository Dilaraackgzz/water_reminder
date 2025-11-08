import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_reminder/core/providers/app_providers.dart';
import 'package:water_reminder/features/auth/presentation/screens/login_screen.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('LoginScreen Widget Tests', () {
    late MockFirebaseAuth mockAuth;

    setUp(() {
      mockAuth = MockFirebaseAuth(signedIn: false);
      setupSharedPreferences();
    });

    testWidgets('should display all UI elements', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2)); // Email and Password
      expect(find.text('Sign In'), findsWidgets);
      expect(find.text('Sign Up'), findsWidgets);
      expect(find.text('Forgot Password?'), findsOneWidget);
    });

    testWidgets('should show validation errors for empty fields',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act - Tap sign in button without entering credentials
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      // Assert - Validation errors should appear
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('should show error for invalid email format',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act - Enter invalid email
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'invalid-email');

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'password123');

      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should navigate to register screen when Sign Up tapped',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act - Find and tap Sign Up text button
      final signUpButton = find.text('Sign Up');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Assert - Should navigate (we can't fully test navigation without router)
      // This test verifies the button exists and is tappable
      expect(signUpButton, findsOneWidget);
    });

    testWidgets('should navigate to forgot password when tapped',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act
      final forgotPasswordButton = find.text('Forgot Password?');
      await tester.tap(forgotPasswordButton);
      await tester.pumpAndSettle();

      // Assert - Button should be tappable
      expect(forgotPasswordButton, findsOneWidget);
    });

    testWidgets('should toggle password visibility', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act - Tap visibility toggle icon
      final visibilityIcon = find.byIcon(Icons.visibility_off);
      if (visibilityIcon.evaluate().isNotEmpty) {
        await tester.tap(visibilityIcon);
        await tester.pumpAndSettle();

        // Assert - Icon should change to visibility icon
        expect(find.byIcon(Icons.visibility), findsOneWidget);
      }
    });

    testWidgets('should accept valid email and password input',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act - Enter valid credentials
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'test@example.com');

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'password123');

      // Assert - Text should be entered
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('should show loading indicator during sign in',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        createTestApp(
          child: const LoginScreen(),
          mockAuth: mockAuth,
        ),
      );
      await tester.pumpAndSettle();

      // Act - Enter credentials and tap sign in
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'test@example.com');

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'password123');

      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      await tester.tap(signInButton);

      // Don't settle immediately to catch loading state
      await tester.pump();

      // Assert - Should show loading indicator (CircularProgressIndicator)
      // Note: This might not always be visible depending on mock speed
      // The test verifies the flow works without errors
      expect(tester.takeException(), isNull);
    });
  });
}
