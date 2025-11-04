import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/statistics/presentation/screens/statistics_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/reminders/presentation/screens/reminders_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/achievements/presentation/screens/achievements_screen.dart';
import '../services/onboarding_service.dart';

// Router provider with auth state management
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final isOnboardingCompleted = ref.watch(isOnboardingCompletedProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isInitialized = authState.hasValue;
      final isAuthenticated = authState.value != null;
      final user = authState.value;
      final isEmailVerified = user?.emailVerified ?? false;

      // Root route - decide where to go based on auth state and onboarding
      if (state.matchedLocation == '/') {
        if (!isInitialized) {
          return '/splash'; // Show splash while checking auth
        }

        if (isAuthenticated) {
          // Check email verification
          if (!isEmailVerified) {
            return '/verify-email';
          }
          return '/home';
        }

        // Not authenticated - check onboarding status
        if (isOnboardingCompleted) {
          return '/login'; // Skip splash, go directly to login
        }

        return '/splash'; // First time user, show splash
      }

      // Special handling for splash screen
      if (state.matchedLocation == '/splash') {
        if (isInitialized && isAuthenticated) {
          if (!isEmailVerified) {
            return '/verify-email';
          }
          return '/home';
        }
        // If onboarding completed but not authenticated, skip splash
        if (isInitialized && !isAuthenticated && isOnboardingCompleted) {
          return '/login';
        }
        return null;
      }

      // If not initialized yet, stay on current route
      if (!isInitialized) {
        return null;
      }

      // Email verification screen - only accessible if authenticated but not verified
      if (state.matchedLocation == '/verify-email') {
        if (!isAuthenticated) {
          return '/login';
        }
        if (isEmailVerified) {
          return '/home';
        }
        return null;
      }

      // Auth routes - redirect based on authentication and verification status
      final isOnAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/forgot-password';

      if (isOnAuthRoute && isAuthenticated) {
        if (!isEmailVerified) {
          return '/verify-email';
        }
        return '/home';
      }

      // Protected routes - redirect to login if not authenticated or verify-email if not verified
      final isOnProtectedRoute = state.matchedLocation == '/home' ||
          state.matchedLocation.startsWith('/profile') ||
          state.matchedLocation.startsWith('/settings') ||
          state.matchedLocation.startsWith('/statistics') ||
          state.matchedLocation.startsWith('/reminders') ||
          state.matchedLocation.startsWith('/achievements');

      if (isOnProtectedRoute) {
        if (!isAuthenticated) {
          return '/login';
        }
        if (!isEmailVerified) {
          return '/verify-email';
        }
      }

      // All good, no redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/verify-email',
        name: 'verifyEmail',
        builder: (context, state) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/statistics',
        name: 'statistics',
        builder: (context, state) => const StatisticsScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/reminders',
        name: 'reminders',
        builder: (context, state) => const RemindersScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/achievements',
        name: 'achievements',
        builder: (context, state) => const AchievementsScreen(),
      ),
    ],
  );
});

// Auth state provider - watches Firebase auth state
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});