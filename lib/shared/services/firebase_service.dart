import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../core/errors/failures.dart';

class FirebaseService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseMessaging _messaging;
  final FirebaseAnalytics _analytics;

  FirebaseService({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required FirebaseMessaging messaging,
    required FirebaseAnalytics analytics,
  })  : _auth = auth,
        _firestore = firestore,
        _messaging = messaging,
        _analytics = analytics;

  Future<void> initialize() async {
    await _setupMessaging();
  }

  Future<void> _setupMessaging() async {
    try {
      await _messaging.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Handle foreground message
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        // Handle message when app is opened from notification
      });

      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        // Handle message when app is opened from terminated state
      }
    } catch (e) {
      // Handle messaging setup error
    }
  }

  Future<String?> getFCMToken() async {
    try {
      return await _messaging.getToken();
    } catch (e) {
      return null;
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _analytics.logLogin(loginMethod: 'email');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Failure.auth(message: _getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw Failure.unknown(message: 'Beklenmeyen bir hata oluştu: $e');
    }
  }

  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _createUserDocument(userCredential.user!);
        await _analytics.logSignUp(signUpMethod: 'email');
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Failure.auth(message: _getAuthErrorMessage(e.code), code: e.code);
    } catch (e) {
      throw Failure.unknown(message: 'Beklenmeyen bir hata oluştu: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _analytics.logEvent(name: 'user_logout');
    } catch (e) {
      throw Failure.unknown(message: 'Çıkış yaparken hata oluştu: $e');
    }
  }

  Future<void> _createUserDocument(User user) async {
    try {
      final userDoc = _firestore
          .collection(AppConstants.usersCollection)
          .doc(user.uid);

      final userData = {
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        'createdAt': FieldValue.serverTimestamp(),
        'lastSignInAt': FieldValue.serverTimestamp(),
        'dailyGoalMl': AppConstants.defaultDailyGoalMl,
        'reminderInterval': AppConstants.defaultReminderIntervalMinutes,
        'reminderEnabled': true,
        'unit': 'ml',
        'profileCompleted': false,
      };

      await userDoc.set(userData, SetOptions(merge: true));
    } catch (e) {
      throw Failure.server(message: 'Kullanıcı profili oluşturulamadı: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      final doc = await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .get();

      return doc.exists ? doc.data() : null;
    } catch (e) {
      throw Failure.server(message: 'Kullanıcı verileri alınamadı: $e');
    }
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore
          .collection(AppConstants.usersCollection)
          .doc(userId)
          .update({
        ...data,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Failure.server(message: 'Kullanıcı verileri güncellenemedi: $e');
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Bu e-posta adresine kayıtlı kullanıcı bulunamadı';
      case 'wrong-password':
        return 'Yanlış şifre';
      case 'email-already-in-use':
        return 'Bu e-posta adresi zaten kullanımda';
      case 'weak-password':
        return 'Şifre çok zayıf';
      case 'invalid-email':
        return 'Geçersiz e-posta adresi';
      case 'user-disabled':
        return 'Bu hesap devre dışı bırakılmış';
      case 'too-many-requests':
        return 'Çok fazla giriş denemesi. Lütfen daha sonra tekrar deneyin';
      case 'operation-not-allowed':
        return 'Bu işlem şu anda izin verilmiyor';
      default:
        return 'Giriş yaparken bir hata oluştu';
    }
  }

  Future<void> logEvent(String eventName, Map<String, Object>? parameters) async {
    try {
      await _analytics.logEvent(name: eventName, parameters: parameters);
    } catch (e) {
      // Analytics hatası uygulamayı etkilememeli
    }
  }
}

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    messaging: FirebaseMessaging.instance,
    analytics: FirebaseAnalytics.instance,
  );
});