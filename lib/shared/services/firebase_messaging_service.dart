import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'notification_service.dart';

/// Top-level function for background message handling
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('📱 Background message received: ${message.messageId}');
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
}

/// Service for handling Firebase Cloud Messaging (Push Notifications)
class FirebaseMessagingService {
  static final FirebaseMessagingService _instance = FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;
  FirebaseMessagingService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationService _notificationService = NotificationService();

  bool _isInitialized = false;
  String? _fcmToken;

  String? get fcmToken => _fcmToken;

  /// Initialize Firebase Messaging
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Request permission for iOS
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('✅ User granted permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        debugPrint('⚠️ User granted provisional permission');
      } else {
        debugPrint('❌ User declined or has not accepted permission');
      }

      // Get FCM token
      _fcmToken = await _messaging.getToken();
      debugPrint('📱 FCM Token: $_fcmToken');

      // Listen to token refresh
      _messaging.onTokenRefresh.listen((newToken) {
        _fcmToken = newToken;
        debugPrint('🔄 FCM Token refreshed: $newToken');
        // TODO: Send token to backend server
      });

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle notification tap (app in background)
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // Handle notification tap (app terminated)
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        _handleMessageOpenedApp(initialMessage);
      }

      // Set foreground notification presentation options (iOS)
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      _isInitialized = true;
      debugPrint('✅ FirebaseMessagingService initialized');
    } catch (e) {
      debugPrint('❌ FirebaseMessagingService initialization failed: $e');
    }
  }

  /// Handle foreground messages
  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('📬 Foreground message received: ${message.messageId}');
    debugPrint('Title: ${message.notification?.title}');
    debugPrint('Body: ${message.notification?.body}');
    debugPrint('Data: ${message.data}');

    // Show local notification when app is in foreground
    if (message.notification != null) {
      _notificationService.showNotification(
        id: message.hashCode,
        title: message.notification!.title ?? 'Aqualert',
        body: message.notification!.body ?? '',
        payload: message.data['payload'],
      );
    }
  }

  /// Handle message when app is opened from notification
  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('🔔 Notification opened app: ${message.messageId}');
    debugPrint('Data: ${message.data}');

    // TODO: Navigate to specific screen based on message data
    final payload = message.data['payload'];
    if (payload != null) {
      _handleNotificationNavigation(payload);
    }
  }

  /// Handle navigation based on notification payload
  void _handleNotificationNavigation(String payload) {
    debugPrint('🧭 Navigating based on payload: $payload');
    // TODO: Implement navigation logic
    // Example: router.push('/statistics') or router.push('/profile')
  }

  /// Subscribe to a topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      debugPrint('✅ Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('❌ Failed to subscribe to topic: $e');
    }
  }

  /// Unsubscribe from a topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      debugPrint('✅ Unsubscribed from topic: $topic');
    } catch (e) {
      debugPrint('❌ Failed to unsubscribe from topic: $e');
    }
  }

  /// Delete FCM token (for logout)
  Future<void> deleteToken() async {
    try {
      await _messaging.deleteToken();
      _fcmToken = null;
      debugPrint('🗑️ FCM token deleted');
    } catch (e) {
      debugPrint('❌ Failed to delete FCM token: $e');
    }
  }

  /// Send token to your backend server
  Future<void> sendTokenToServer(String userId) async {
    if (_fcmToken == null) return;

    // TODO: Implement API call to send token to backend
    debugPrint('📤 Sending FCM token to server for user: $userId');
    debugPrint('Token: $_fcmToken');

    // Example implementation:
    // try {
    //   await http.post(
    //     Uri.parse('https://your-api.com/fcm-token'),
    //     body: {'userId': userId, 'fcmToken': _fcmToken},
    //   );
    // } catch (e) {
    //   debugPrint('Failed to send token to server: $e');
    // }
  }
}
