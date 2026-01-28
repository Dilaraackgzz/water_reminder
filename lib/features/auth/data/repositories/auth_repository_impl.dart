import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseException;
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImpl({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google Sign-In was cancelled');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      return _userToUserModel(userCredential.user!);
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      print('DEBUG: Attempting sign in with email: $email');
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('DEBUG: Sign in successful');
      return _userToUserModel(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      print('DEBUG: FirebaseAuthException - code: ${e.code}, message: ${e.message}');
      throw Exception(_handleAuthException(e));
    } on FirebaseException catch (e) {
      print('DEBUG: FirebaseException - code: ${e.code}, message: ${e.message}');
      throw Exception(_handleFirebaseException(e));
    } catch (e) {
      print('DEBUG: General exception - type: ${e.runtimeType}, error: $e');
      throw Exception('Giriş yapılırken bir hata oluştu: $e');
    }
  }

  @override
  Future<UserModel> registerWithEmail(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      print('DEBUG: Attempting register with email: $email, password length: ${password.length}');
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('DEBUG: Register successful, user: ${userCredential.user?.uid}');
      print('DEBUG: Current user after register: ${_firebaseAuth.currentUser?.email}');

      await userCredential.user!.updateDisplayName(displayName);
      await userCredential.user!.sendEmailVerification();

      return _userToUserModel(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      print('DEBUG: Register FirebaseAuthException - code: ${e.code}, message: ${e.message}');
      throw Exception(_handleAuthException(e));
    } on FirebaseException catch (e) {
      print('DEBUG: Register FirebaseException - code: ${e.code}, message: ${e.message}');
      throw Exception(_handleFirebaseException(e));
    } catch (e) {
      print('DEBUG: Register general exception - type: ${e.runtimeType}, error: $e');
      throw Exception('Kayıt olurken bir hata oluştu: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleAuthException(e));
    } catch (e) {
      throw Exception('Şifre sıfırlama e-postası gönderilirken bir hata oluştu: $e');
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    await _firebaseAuth.currentUser?.reload();
    return _firebaseAuth.currentUser?.emailVerified ?? false;
  }

  @override
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  UserModel _userToUserModel(User user) {
    return UserModel(
      id: user.uid,
      email: user.email!,
      displayName: user.displayName,
      photoUrl: user.photoURL,
      isEmailVerified: user.emailVerified,
      createdAt: user.metadata.creationTime,
      lastLoginAt: user.metadata.lastSignInTime,
    );
  }

  String _handleAuthException(FirebaseAuthException e) {
    return _getErrorMessage(e.code, e.message);
  }

  String _handleFirebaseException(FirebaseException e) {
    return _getErrorMessage(e.code, e.message);
  }

  String _getErrorMessage(String code, String? message) {
    switch (code) {
      case 'user-not-found':
        return 'Bu e-posta ile kayıtlı kullanıcı bulunamadı.';
      case 'wrong-password':
        return 'Hatalı şifre girdiniz.';
      case 'invalid-credential':
        return 'E-posta veya şifre hatalı.';
      case 'email-already-in-use':
        return 'Bu e-posta adresi zaten kullanılıyor.';
      case 'weak-password':
        return 'Şifreniz çok zayıf. Daha güçlü bir şifre seçin.';
      case 'invalid-email':
        return 'Geçersiz e-posta adresi.';
      case 'user-disabled':
        return 'Bu hesap devre dışı bırakılmış.';
      case 'operation-not-allowed':
        return 'Bu işlem şu anda kullanılamıyor.';
      case 'too-many-requests':
        return 'Çok fazla deneme yaptınız. Lütfen daha sonra tekrar deneyin.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'E-posta veya şifre hatalı.';
      default:
        return 'Bir hata oluştu: $message';
    }
  }
}
