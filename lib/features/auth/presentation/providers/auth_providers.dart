import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    firebaseAuth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn(),
  );
});

// Auth State Provider
final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

// Current User Provider
final currentUserProvider = Provider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
});