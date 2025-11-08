import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_reminder/features/auth/domain/repositories/auth_repository.dart';

void main() {
  group('AuthRepository Tests', () {
    late MockFirebaseAuth mockAuth;
    late AuthRepository authRepository;

    setUp(() {
      mockAuth = MockFirebaseAuth(signedIn: false);
      authRepository = AuthRepository(auth: mockAuth);
    });

    group('Sign In with Email and Password', () {
      test('should sign in successfully with valid credentials', () async {
        // Arrange
        const email = 'test@example.com';
        const password = 'password123';

        // Act
        final result = await authRepository.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result.isRight(), true);
        expect(mockAuth.currentUser, isNotNull);
        expect(mockAuth.currentUser?.email, email);
      });

      test('should return error for invalid email format', () async {
        // Arrange
        const email = 'invalid-email';
        const password = 'password123';

        // Act
        final result = await authRepository.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result.isLeft(), true);
      });

      test('should return error for empty credentials', () async {
        // Arrange
        const email = '';
        const password = '';

        // Act
        final result = await authRepository.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result.isLeft(), true);
      });
    });

    group('Sign Up with Email and Password', () {
      test('should create new user successfully', () async {
        // Arrange
        const email = 'newuser@example.com';
        const password = 'password123';

        // Act
        final result = await authRepository.signUpWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result.isRight(), true);
        expect(mockAuth.currentUser, isNotNull);
        expect(mockAuth.currentUser?.email, email);
      });

      test('should return error for weak password', () async {
        // Arrange
        const email = 'test@example.com';
        const password = '123'; // Too short

        // Act
        final result = await authRepository.signUpWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result.isLeft(), true);
      });

      test('should return error for invalid email', () async {
        // Arrange
        const email = 'invalid-email';
        const password = 'password123';

        // Act
        final result = await authRepository.signUpWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Assert
        expect(result.isLeft(), true);
      });
    });

    group('Sign Out', () {
      test('should sign out successfully', () async {
        // Arrange - Sign in first
        await authRepository.signInWithEmailAndPassword(
          email: 'test@example.com',
          password: 'password123',
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

        // Act
        final result = await authRepository.sendPasswordResetEmail(email: email);

        // Assert
        expect(result.isRight(), true);
      });

      test('should return error for invalid email', () async {
        // Arrange
        const email = 'invalid-email';

        // Act
        final result = await authRepository.sendPasswordResetEmail(email: email);

        // Assert
        expect(result.isLeft(), true);
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
        authRepository = AuthRepository(auth: mockAuth);

        // Act & Assert
        expect(
          () => authRepository.sendEmailVerification(),
          returnsNormally,
        );
      });
    });

    group('Current User', () {
      test('should return null when no user is signed in', () {
        // Arrange - mockAuth is already signed out

        // Act
        final user = mockAuth.currentUser;

        // Assert
        expect(user, isNull);
      });

      test('should return user when signed in', () async {
        // Arrange & Act
        await authRepository.signInWithEmailAndPassword(
          email: 'test@example.com',
          password: 'password123',
        );

        // Assert
        expect(mockAuth.currentUser, isNotNull);
        expect(mockAuth.currentUser?.email, 'test@example.com');
      });
    });

    group('Auth State Stream', () {
      test('should emit user when signed in', () async {
        // Arrange
        const email = 'test@example.com';

        // Act
        await authRepository.signInWithEmailAndPassword(
          email: email,
          password: 'password123',
        );

        // Assert
        expect(mockAuth.authStateChanges(), emits(isA<User>()));
      });

      test('should emit null when signed out', () async {
        // Arrange - Sign in first
        await authRepository.signInWithEmailAndPassword(
          email: 'test@example.com',
          password: 'password123',
        );

        // Act
        await authRepository.signOut();

        // Assert
        expect(mockAuth.authStateChanges(), emits(isNull));
      });
    });
  });
}
