import 'package:flutter/material.dart';
import 'notification_service.dart';
import 'local_storage_service.dart';

/// Smart reminder service for water drinking notifications
class ReminderService {
  final NotificationService _notificationService;
  final LocalStorageService _storageService;

  ReminderService({
    required NotificationService notificationService,
    required LocalStorageService storageService,
  })  : _notificationService = notificationService,
        _storageService = storageService;

  // Storage keys
  static const String _reminderEnabledKey = 'reminder_enabled';
  static const String _reminderIntervalKey = 'reminder_interval_minutes';
  static const String _reminderStartTimeKey = 'reminder_start_time';
  static const String _reminderEndTimeKey = 'reminder_end_time';
  static const String _lastScheduleDateKey = 'last_schedule_date';

  // Default values
  static const int _defaultInterval = 60; // 60 minutes
  static const TimeOfDay _defaultStartTime = TimeOfDay(hour: 8, minute: 0);
  static const TimeOfDay _defaultEndTime = TimeOfDay(hour: 22, minute: 0);

  // Notification IDs
  static const int _baseNotificationId = 1000;

  /// Check if reminders are enabled
  bool isReminderEnabled() {
    return _storageService.getSetting<bool>(
          _reminderEnabledKey,
          defaultValue: true,
        ) ??
        true;
  }

  /// Enable or disable reminders
  Future<void> setReminderEnabled(bool enabled) async {
    await _storageService.saveSetting(_reminderEnabledKey, enabled);
    if (enabled) {
      await scheduleReminders();
    } else {
      await cancelAllReminders();
    }
  }

  /// Get reminder interval in minutes
  int getReminderInterval() {
    return _storageService.getSetting<int>(
          _reminderIntervalKey,
          defaultValue: _defaultInterval,
        ) ??
        _defaultInterval;
  }

  /// Set reminder interval in minutes
  Future<void> setReminderInterval(int minutes) async {
    await _storageService.saveSetting(_reminderIntervalKey, minutes);
    if (isReminderEnabled()) {
      await scheduleReminders();
    }
  }

  /// Get reminder start time
  TimeOfDay getReminderStartTime() {
    final timeString = _storageService.getSetting<String>(_reminderStartTimeKey);
    if (timeString != null) {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    return _defaultStartTime;
  }

  /// Set reminder start time
  Future<void> setReminderStartTime(TimeOfDay time) async {
    await _storageService.saveSetting(
      _reminderStartTimeKey,
      '${time.hour}:${time.minute}',
    );
    if (isReminderEnabled()) {
      await scheduleReminders();
    }
  }

  /// Get reminder end time
  TimeOfDay getReminderEndTime() {
    final timeString = _storageService.getSetting<String>(_reminderEndTimeKey);
    if (timeString != null) {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
    return _defaultEndTime;
  }

  /// Set reminder end time
  Future<void> setReminderEndTime(TimeOfDay time) async {
    await _storageService.saveSetting(
      _reminderEndTimeKey,
      '${time.hour}:${time.minute}',
    );
    if (isReminderEnabled()) {
      await scheduleReminders();
    }
  }

  /// Check if reminders need to be rescheduled for today
  /// Should be called on app startup
  Future<void> checkAndScheduleDaily() async {
    if (!isReminderEnabled()) return;

    final lastScheduleDate = _storageService.getSetting<String>(_lastScheduleDateKey);
    final today = DateTime.now();
    final todayString = '${today.year}-${today.month}-${today.day}';

    // If never scheduled or last scheduled on a different day, reschedule
    if (lastScheduleDate == null || lastScheduleDate != todayString) {
      debugPrint('📅 Scheduling reminders for today: $todayString');
      await scheduleReminders();
      await _storageService.saveSetting(_lastScheduleDateKey, todayString);
    } else {
      debugPrint('✅ Reminders already scheduled for today');
    }
  }

  /// Schedule all reminders based on settings
  Future<void> scheduleReminders() async {
    // Cancel existing reminders first
    await cancelAllReminders();

    if (!isReminderEnabled()) return;

    final interval = getReminderInterval();
    final startTime = getReminderStartTime();
    final endTime = getReminderEndTime();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    // Schedule for today and tomorrow to ensure continuous coverage
    final reminderTimes = <DateTime>[];
    int notificationId = _baseNotificationId;

    // Schedule for today
    var startDateTime = DateTime(
      today.year,
      today.month,
      today.day,
      startTime.hour,
      startTime.minute,
    );
    var endDateTime = DateTime(
      today.year,
      today.month,
      today.day,
      endTime.hour,
      endTime.minute,
    );

    var currentTime = startDateTime;
    while (currentTime.isBefore(endDateTime)) {
      if (currentTime.isAfter(now)) {
        reminderTimes.add(currentTime);
      }
      currentTime = currentTime.add(Duration(minutes: interval));
    }

    // Schedule for tomorrow
    startDateTime = DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      startTime.hour,
      startTime.minute,
    );
    endDateTime = DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      endTime.hour,
      endTime.minute,
    );

    currentTime = startDateTime;
    while (currentTime.isBefore(endDateTime)) {
      reminderTimes.add(currentTime);
      currentTime = currentTime.add(Duration(minutes: interval));
    }

    // Schedule notifications
    for (final time in reminderTimes) {
      if (notificationId >= _baseNotificationId + 100) break; // Safety limit
      await _notificationService.scheduleNotification(
        id: notificationId++,
        title: _getRandomReminderTitle(),
        body: _getRandomReminderBody(),
        scheduledTime: time,
        payload: 'water_reminder',
      );
    }

    // Update last schedule date
    final todayString = '${today.year}-${today.month}-${today.day}';
    await _storageService.saveSetting(_lastScheduleDateKey, todayString);

    debugPrint('📅 Scheduled ${reminderTimes.length} reminders (today + tomorrow)');
  }

  /// Cancel all reminders
  Future<void> cancelAllReminders() async {
    // Cancel all notifications with IDs starting from base
    for (int i = _baseNotificationId; i < _baseNotificationId + 100; i++) {
      await _notificationService.cancelNotification(i);
    }
    debugPrint('🚫 Cancelled all reminders');
  }

  /// Schedule a custom one-time reminder
  Future<void> scheduleCustomReminder({
    required DateTime time,
    String? customMessage,
  }) async {
    final notificationId = _baseNotificationId + 500 + DateTime.now().millisecondsSinceEpoch % 100;

    await _notificationService.scheduleNotification(
      id: notificationId,
      title: 'Water Reminder',
      body: customMessage ?? _getRandomReminderBody(),
      scheduledTime: time,
      payload: 'custom_reminder',
    );

    debugPrint('⏰ Custom reminder scheduled for $time');
  }

  /// Get random motivational reminder title
  String _getRandomReminderTitle() {
    final titles = [
      '💧 Time to Hydrate!',
      '🌊 Water Break!',
      '💦 Stay Hydrated!',
      '✨ Drink Some Water!',
      '🚰 Hydration Time!',
      '🌟 Water Reminder!',
      '💙 Take Care of Yourself!',
    ];
    titles.shuffle();
    return titles.first;
  }

  /// Get random motivational reminder body
  String _getRandomReminderBody() {
    final bodies = [
      'Time to drink some water! Your body needs hydration.',
      'Don\'t forget to stay hydrated throughout the day!',
      'A quick water break can boost your energy!',
      'Your health matters! Take a moment to drink water.',
      'Keep your body happy with some refreshing water!',
      'Stay healthy and hydrated! Drink up!',
      'Time for a water break! You\'re doing great!',
      'Remember to drink water regularly for better health!',
    ];
    bodies.shuffle();
    return bodies.first;
  }

  /// Check pending reminders count
  Future<int> getPendingRemindersCount() async {
    final pending = await _notificationService.getPendingNotifications();
    return pending.length;
  }

  /// Smart reminder algorithm - adjust based on user behavior
  /// TODO: Implement ML-based smart reminders in future versions
  Future<void> adjustRemindersBasedOnActivity({
    required int todayIntake,
    required int targetGoal,
    required int currentHour,
  }) async {
    // Calculate progress percentage
    final progressPercentage = (todayIntake / targetGoal * 100).round();

    // If user is behind schedule, increase reminder frequency
    final expectedProgress = (currentHour - 8) / 14 * 100; // Assume 8AM-10PM window

    if (progressPercentage < expectedProgress - 20) {
      // Behind schedule - increase frequency
      final currentInterval = getReminderInterval();
      if (currentInterval > 30) {
        await setReminderInterval(currentInterval - 15);
        debugPrint('⚡ Increased reminder frequency due to low progress');
      }
    } else if (progressPercentage > expectedProgress + 20) {
      // Ahead of schedule - decrease frequency
      final currentInterval = getReminderInterval();
      if (currentInterval < 120) {
        await setReminderInterval(currentInterval + 15);
        debugPrint('😌 Decreased reminder frequency - good progress!');
      }
    }
  }
}