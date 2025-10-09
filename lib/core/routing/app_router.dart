import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../providers/app_providers.dart';

// Router provider with auth state management
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isInitialized = authState.hasValue;
      final isAuthenticated = authState.value != null;

      // Special handling for splash screen - always allow
      if (state.matchedLocation == '/splash') {
        return null;
      }

      // If not initialized yet, stay on current route
      if (!isInitialized) {
        return null;
      }

      // Auth routes - redirect to home if already authenticated
      final isOnAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/forgot-password';

      if (isOnAuthRoute && isAuthenticated) {
        return '/home';
      }

      // Protected routes - redirect to login if not authenticated
      final isOnProtectedRoute = state.matchedLocation == '/home' ||
          state.matchedLocation.startsWith('/profile') ||
          state.matchedLocation.startsWith('/settings');

      if (isOnProtectedRoute && !isAuthenticated) {
        return '/login';
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
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});

// Auth state provider - watches Firebase auth state
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});