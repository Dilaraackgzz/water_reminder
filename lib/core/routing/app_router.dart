import 'package:flutter/material.dart';
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
import '../../features/help/presentation/screens/help_screen.dart';
import '../../features/help/presentation/screens/privacy_policy_screen.dart';
import '../../features/premium/presentation/screens/paywall_screen.dart';
import '../services/onboarding_service.dart';

// Auth state provider - watches Firebase auth state
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// Notifier that signals GoRouter to re-evaluate redirects without recreating it
class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<User?>>(authStateProvider, (_, __) {
      notifyListeners();
    });
    _ref.listen<bool>(isOnboardingCompletedProvider, (_, __) {
      notifyListeners();
    });
  }

  final Ref _ref;

  AsyncValue<User?> get authState => _ref.read(authStateProvider);
  bool get isOnboardingCompleted => _ref.read(isOnboardingCompletedProvider);
}

final _routerNotifierProvider = ChangeNotifierProvider<_RouterNotifier>((ref) {
  return _RouterNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(_routerNotifierProvider);

  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = notifier.authState;
      final isOnboardingCompleted = notifier.isOnboardingCompleted;

      final isInitialized = authState.hasValue;
      final isAuthenticated = authState.value != null;
      final user = authState.value;
      final isEmailVerified = user?.emailVerified ?? false;

      // Root route always goes to splash — SplashScreen handles the rest
      if (state.matchedLocation == '/') {
        return '/splash';
      }

      // Splash screen manages its own navigation after animation completes
      if (state.matchedLocation == '/splash') {
        return null;
      }

      if (!isInitialized) {
        return null;
      }

      // Email verification screen
      if (state.matchedLocation == '/verify-email') {
        if (!isAuthenticated) {
          return '/login';
        }
        if (isEmailVerified) {
          return '/home';
        }
        return null;
      }

      // Auth routes
      final isOnAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/forgot-password';

      if (isOnAuthRoute && isAuthenticated) {
        if (!isEmailVerified) {
          return '/verify-email';
        }
        return '/home';
      }

      // Protected routes
      final isOnProtectedRoute = state.matchedLocation == '/home' ||
          state.matchedLocation.startsWith('/profile') ||
          state.matchedLocation.startsWith('/settings') ||
          state.matchedLocation.startsWith('/statistics') ||
          state.matchedLocation.startsWith('/reminders') ||
          state.matchedLocation.startsWith('/achievements') ||
          state.matchedLocation.startsWith('/help');

      if (isOnProtectedRoute) {
        if (!isAuthenticated) {
          return '/login';
        }
        if (!isEmailVerified) {
          return '/verify-email';
        }
      }

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
      GoRoute(
        path: '/help',
        name: 'help',
        builder: (context, state) => const HelpScreen(),
      ),
      GoRoute(
        path: '/privacy-policy',
        name: 'privacyPolicy',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});
