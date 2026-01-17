import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user_model.dart';
import 'auth_providers.dart';
import '../../../../core/services/onboarding_service.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<UserModel?>>((ref) {
  return AuthController(ref);
});

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  final Ref _ref;

  AuthController(this._ref) : super(const AsyncValue.data(null));

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      final authRepository = _ref.read(authRepositoryProvider);
      final user = await authRepository.signInWithGoogle();

      // Mark onboarding as completed on first login
      final onboardingService = _ref.read(onboardingServiceProvider);
      await onboardingService.completeOnboarding();

      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final authRepository = _ref.read(authRepositoryProvider);
      final user = await authRepository.signInWithEmail(email, password);

      // Mark onboarding as completed on first login
      final onboardingService = _ref.read(onboardingServiceProvider);
      await onboardingService.completeOnboarding();

      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> registerWithEmail(
    String email,
    String password,
    String displayName,
  ) async {
    state = const AsyncValue.loading();
    try {
      final authRepository = _ref.read(authRepositoryProvider);
      final user = await authRepository.registerWithEmail(
        email,
        password,
        displayName,
      );

      // Mark onboarding as completed on registration
      final onboardingService = _ref.read(onboardingServiceProvider);
      await onboardingService.completeOnboarding();

      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    try {
      final authRepository = _ref.read(authRepositoryProvider);
      await authRepository.signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      final authRepository = _ref.read(authRepositoryProvider);
      await authRepository.resetPassword(email);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}