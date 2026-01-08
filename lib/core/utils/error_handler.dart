import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Global error handler for the app
class ErrorHandler {
  /// Get user-friendly error message from exception
  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return _getFirebaseAuthErrorMessage(error);
    } else if (error is FirebaseException) {
      return _getFirebaseErrorMessage(error);
    } else if (error is FormatException) {
      return 'Invalid data format. Please check your input.';
    } else if (error is Exception) {
      final message = error.toString();
      if (message.contains('network')) {
        return 'Network error. Please check your connection.';
      }
      return message.replaceAll('Exception: ', '');
    }
    return 'An unexpected error occurred. Please try again.';
  }

  /// Firebase Auth specific error messages
  static String _getFirebaseAuthErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Password is too weak. Use at least 6 characters.';
      case 'invalid-email':
        return 'Invalid email address format.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'invalid-credential':
        return 'Invalid credentials. Please check your input.';
      default:
        return 'Authentication failed: ${error.message ?? "Unknown error"}';
    }
  }

  /// Firebase general error messages
  static String _getFirebaseErrorMessage(FirebaseException error) {
    switch (error.code) {
      case 'unavailable':
        return 'Service unavailable. Please try again later.';
      case 'permission-denied':
        return 'Permission denied. Please check your access rights.';
      case 'not-found':
        return 'Data not found.';
      case 'already-exists':
        return 'This data already exists.';
      case 'cancelled':
        return 'Operation cancelled.';
      case 'deadline-exceeded':
        return 'Operation timed out. Please try again.';
      default:
        return 'Database error: ${error.message ?? "Unknown error"}';
    }
  }

  /// Check if error is network related
  static bool isNetworkError(dynamic error) {
    final message = error.toString().toLowerCase();
    return message.contains('network') ||
        message.contains('connection') ||
        message.contains('timeout') ||
        (error is FirebaseException && error.code == 'unavailable');
  }

  /// Log error for debugging (can be extended with crash reporting)
  static void logError(dynamic error, StackTrace? stackTrace) {
    // In production, send to crash reporting service (e.g., Firebase Crashlytics)
    debugPrint('Error: $error');
    if (stackTrace != null) {
      debugPrint('Stack trace: $stackTrace');
    }
  }
}

/// Extension for easier error handling in widgets
extension ErrorHandlerExtension on dynamic {
  String get userMessage => ErrorHandler.getErrorMessage(this);
  bool get isNetworkError => ErrorHandler.isNetworkError(this);
}
