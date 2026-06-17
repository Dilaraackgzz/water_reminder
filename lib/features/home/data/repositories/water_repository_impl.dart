import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:water_reminder/features/home/domain/models/user_settings.dart';
import '../../domain/models/water_intake.dart';
import '../../domain/models/daily_goal.dart';
import '../../domain/repositories/water_repository.dart';
import '../datasources/water_local_datasource.dart';
import '../../../home/domain/repositories/settings_repository.dart';

class WaterRepositoryImpl implements WaterRepository {
  final WaterLocalDataSource _localDataSource;
  final SettingsRepository _settingsRepository;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  WaterRepositoryImpl({
    required WaterLocalDataSource localDataSource,
    required SettingsRepository settingsRepository,
    required FirebaseAuth auth,
    FirebaseFirestore? firestore,
  })  : _localDataSource = localDataSource,
        _settingsRepository = settingsRepository,
        _auth = auth,
        _firestore = firestore ?? FirebaseFirestore.instance;

  String get _currentUserId => _auth.currentUser?.uid ?? '';

  CollectionReference<Map<String, dynamic>> _waterIntakesCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('water_intakes');

  @override
  Future<void> addWaterIntake(WaterIntake intake) async {
    await _localDataSource.addWaterIntake(intake);

    // Firestore'a arka planda yaz (hata app'i etkilemez)
    _syncIntakeToCloud(intake);

    // Update today's daily goal
    final today = DateTime.now();
    final todayGoal = await getTodaysDailyGoal();
    final intakesToday = await getWaterIntakesForDate(today);
    final totalAmount = intakesToday.fold<int>(
      0,
      (acc, intake) => acc + intake.amount,
    );

    final updatedGoal = todayGoal.copyWith(currentAmount: totalAmount);
    await _localDataSource.saveDailyGoal(updatedGoal);
  }

  @override
  Future<void> deleteWaterIntake(String intakeId) async {
    await _localDataSource.deleteWaterIntake(intakeId);

    // Firestore'dan arka planda sil
    _deleteIntakeFromCloud(intakeId);

    // Update today's daily goal
    final today = DateTime.now();
    final todayGoal = await getTodaysDailyGoal();
    final intakesToday = await getWaterIntakesForDate(today);
    final totalAmount = intakesToday.fold<int>(
      0,
      (acc, intake) => acc + intake.amount,
    );

    final updatedGoal = todayGoal.copyWith(currentAmount: totalAmount);
    await _localDataSource.saveDailyGoal(updatedGoal);
  }

  @override
  Future<DailyGoal?> getDailyGoalForDate(DateTime date) async {
    return _localDataSource.getDailyGoalForDate(date);
  }

  @override
  Future<DailyGoal> getTodaysDailyGoal() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);

    var dailyGoal = await _localDataSource.getDailyGoalForDate(startOfDay);

    // If no goal exists for today, create one
    if (dailyGoal == null) {
      final settings = await _settingsRepository.getUserSettings();
      final targetAmount = settings.activeDailyGoal;

      dailyGoal = DailyGoal(
        userId: _currentUserId,
        targetAmount: targetAmount,
        date: startOfDay,
        currentAmount: 0,
      );

      await _localDataSource.saveDailyGoal(dailyGoal);
    }

    return dailyGoal;
  }

  @override
  Future<List<WaterIntake>> getWaterIntakesForDate(DateTime date) async {
    return _localDataSource.getWaterIntakesForDate(date);
  }

  @override
  Future<List<WaterIntake>> getWaterIntakesForDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return _localDataSource.getWaterIntakesForDateRange(startDate, endDate);
  }

  @override
  Future<void> updateDailyGoal(DailyGoal goal) async {
    await _localDataSource.saveDailyGoal(goal);
  }

  @override
  Stream<DailyGoal> watchTodaysDailyGoal() {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);

    return _localDataSource.watchDailyGoalForDate(startOfDay).asyncMap((goal) async {
      if (goal != null) return goal;

      // Create today's goal if it doesn't exist
      return await getTodaysDailyGoal();
    });
  }

  @override
  Stream<List<WaterIntake>> watchTodaysWaterIntakes() {
    return _localDataSource.watchWaterIntakes().map((allIntakes) {
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      return allIntakes
          .where((intake) =>
              intake.userId == _currentUserId &&
              intake.timestamp.isAfter(startOfDay) &&
              intake.timestamp.isBefore(endOfDay))
          .toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    });
  }

  /// Firestore'dan yerel Hive deposuna su kayıtlarını çek ve birleştir
  @override
  Future<void> syncFromCloud() async {
    final userId = _currentUserId;
    if (userId.isEmpty) return;

    try {
      final snapshot = await _waterIntakesCollection(userId).get();

      if (snapshot.docs.isEmpty) return;

      // Mevcut yerel kayıtları al (tekrar eklememek için)
      final localIntakes = await _localDataSource.getAllWaterIntakes();
      final localIds = localIntakes.map((i) => i.id).toSet();

      for (final doc in snapshot.docs) {
        final data = doc.data();
        if (!localIds.contains(data['id'])) {
          try {
            final intake = WaterIntake.fromJson(Map<String, dynamic>.from(data));
            await _localDataSource.addWaterIntake(intake);
          } catch (e) {
            debugPrint('Failed to parse intake from cloud: $e');
          }
        }
      }
    } catch (e) {
      // Senkronizasyon hatası uygulamayı etkilemez; yerel veri kullanılmaya devam eder
      debugPrint('Cloud sync failed: $e');
    }
  }

  Future<void> _syncIntakeToCloud(WaterIntake intake) async {
    final userId = _currentUserId;
    if (userId.isEmpty) return;

    try {
      await _waterIntakesCollection(userId).doc(intake.id).set(intake.toJson());
    } catch (e) {
      debugPrint('Failed to sync intake to cloud: $e');
    }
  }

  Future<void> _deleteIntakeFromCloud(String intakeId) async {
    final userId = _currentUserId;
    if (userId.isEmpty) return;

    try {
      await _waterIntakesCollection(userId).doc(intakeId).delete();
    } catch (e) {
      debugPrint('Failed to delete intake from cloud: $e');
    }
  }
}
