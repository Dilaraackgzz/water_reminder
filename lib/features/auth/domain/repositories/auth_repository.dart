import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;
  User? get currentUser;

  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithEmail(String email, String password);
  Future<UserModel> registerWithEmail(String email, String password, String displayName);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<bool> isEmailVerified();
  Future<void> sendEmailVerification();
}