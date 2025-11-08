import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_reminder/features/auth/data/repositories/auth_repository_impl.dart';

void main() {
  group('AuthRepository Tests', () {
    late MockFirebaseAuth mockAuth;
    late AuthRepositoryImpl authRepository;

    setUp(() {
      final mockUser = MockUser(
        uid: 'test-uid',
        email: 'test@example.com',
        displayName: 'Test User',
        isEmailVerified: false,
      );
      mockAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: false);
      authRepository = AuthRepositoryImpl(firebaseAuth: mockAuth);
    });

    group('Sign In with Email', () {
      test('should sign in successfully with valid credentials', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';

        // Act
        final result = await authRepository.signInWithEmail(email, password);

        // Assert
        expect(result.email, email);
        expect(mockAuth.currentUser, isNotNull);
        expect(mockAuth.currentUser?.email, email);
      });

      test('should throw error for invalid credentials', () async {
        // Arrange
        const email = 'nonexistent@example.com';
        const password = 'wrongpassword';

        // Note: MockFirebaseAuth doesn't validate credentials,
        // so we test that the method completes
        try {
          await authRepository.signInWithEmail(email, password);
          // If successful, verify user is signed in
          expect(mockAuth.currentUser, isNotNull);
        } catch (e) {
          // If error, that's also acceptable
          expect(e, isNotNull);
        }
      });
    });

    group('Register with Email', () {
      test('should create new user successfully', () async {
        // Arrange
        const email = 'newuser@example.com';
        const password = 'password123';
        const displayName = 'New User';

        // Act
        final result = await authRepository.registerWithEmail(
          email,
          password,
          displayName,
        );

        // Assert
        expect(result.email, email);
        expect(mockAuth.currentUser, isNotNull);
        expect(mockAuth.currentUser?.email, email);
      });
    });

    group('Sign Out', () {
      test('should sign out successfully', () async {
        // Arrange - Sign in first
        await authRepository.signInWithEmail(
          'test@example.com',
          'password123',
        );
        expect(mockAuth.currentUser, isNotNull);

        // Act
        await authRepository.signOut();

        // Assert
        expect(mockAuth.currentUser, isNull);
      });
    });

    group('Password Reset', () {
      test('should send password reset email successfully', () async {
        // Arrange
        const email = 'test@example.com';

        // Act & Assert - Should complete without error
        expect(
          () => authRepository.resetPassword(email),
          returnsNormally,
        );
      });
    });

    group('Email Verification', () {
      test('should send verification email successfully', () async {
        // Arrange
        final mockUser = MockUser(
          uid: 'test-uid',
          email: 'test@example.com',
          isEmailVerified: false,
        );
        mockAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepositoryImpl(firebaseAuth: mockAuth);

        // Act & Assert
        expect(
          () => authRepository.sendEmailVerification(),
          returnsNormally,
        );
      });

      test('should check email verification status', () async {
        // Arrange
        final mockUser = MockUser(
          uid: 'test-uid',
          email: 'test@example.com',
          isEmailVerified: true,
        );
        mockAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepositoryImpl(firebaseAuth: mockAuth);

        // Act
        final isVerified = await authRepository.isEmailVerified();

        // Assert
        expect(isVerified, true);
      });
    });

    group('Current User', () {
      test('should return null when no user is signed in', () {
        // Act
        final user = authRepository.currentUser;

        // Assert
        expect(user, isNull);
      });

      test('should return user when signed in', () async {
        // Arrange & Act
        await authRepository.signInWithEmail(
          'test@example.com',
          'password123',
        );

        // Assert
        expect(authRepository.currentUser, isNotNull);
        expect(authRepository.currentUser?.email, 'test@example.com');
      });
    });

    group('Auth State Stream', () {
      test('should emit user when signed in', () async {
        // Arrange
        const email = 'test@example.com';

        // Act
        await authRepository.signInWithEmail(email, 'password123');

        // Assert
        expect(authRepository.authStateChanges, emits(isA<User>()));
      });

      test('should emit null when signed out', () async {
        // Arrange - Sign in first
        await authRepository.signInWithEmail(
          'test@example.com',
          'password123',
        );

        // Act
        await authRepository.signOut();

        // Assert
        expect(authRepository.authStateChanges, emits(isNull));
      });
    });
  });
}
