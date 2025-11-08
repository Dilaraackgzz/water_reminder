import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Service for exporting and importing user data
class DataExportService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  DataExportService({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  /// Export all user data to JSON format
  Future<Map<String, dynamic>> exportUserData() async {
    final userId = _auth.currentUser?.uid;
    print('🔍 DataExport: Starting export for user: $userId');

    if (userId == null) {
      print('❌ DataExport: User not authenticated');
      throw Exception('User not authenticated');
    }

    try {
      // Fetch user profile
      print('📊 DataExport: Fetching user profile...');
      final profileDoc = await _firestore.collection('users').doc(userId).get();
      final profileData = profileDoc.data();
      print('✅ DataExport: Profile fetched: ${profileData != null}');

    // Fetch water records (without orderBy to avoid index requirement)
    print('💧 DataExport: Fetching water records...');
    final waterRecordsSnapshot = await _firestore
        .collection('water_records')
        .where('userId', isEqualTo: userId)
        .get();
    print('✅ DataExport: Water records fetched: ${waterRecordsSnapshot.docs.length} records');

    // Sort in memory
    final waterRecords = waterRecordsSnapshot.docs.map((doc) {
      final data = doc.data();
      return {
        'id': doc.id,
        'amount': data['amount'],
        'timestamp': (data['timestamp'] as Timestamp).toDate().toIso8601String(),
        'date': data['date'],
      };
    }).toList()
      ..sort((a, b) => DateTime.parse(b['timestamp'] as String)
          .compareTo(DateTime.parse(a['timestamp'] as String)));

    // Fetch daily goals (without orderBy to avoid index requirement)
    print('🎯 DataExport: Fetching daily goals...');
    final dailyGoalsSnapshot = await _firestore
        .collection('daily_goals')
        .where('userId', isEqualTo: userId)
        .get();
    print('✅ DataExport: Daily goals fetched: ${dailyGoalsSnapshot.docs.length} goals');

    // Sort in memory
    final dailyGoals = dailyGoalsSnapshot.docs.map((doc) {
      final data = doc.data();
      return {
        'date': data['date'],
        'targetAmount': data['targetAmount'],
        'currentAmount': data['currentAmount'],
      };
    }).toList()
      ..sort((a, b) => (b['date'] as String).compareTo(a['date'] as String));

      // Create export data
      print('📦 DataExport: Creating export data structure...');
      final exportData = {
        'version': '1.0',
        'exportDate': DateTime.now().toIso8601String(),
        'userId': userId,
        'profile': profileData,
        'waterRecords': waterRecords,
        'dailyGoals': dailyGoals,
        'totalRecords': waterRecords.length,
      };

      print('✅ DataExport: Export data created successfully');
      return exportData;
    } catch (e) {
      print('❌ DataExport: Failed to export data: $e');
      throw Exception('Failed to export data: ${e.toString()}');
    }
  }

  /// Export data and save to file
  Future<String> exportToFile() async {
    try {
      print('📂 DataExport: Starting file export...');
      final exportData = await exportUserData();

      print('📝 DataExport: Converting to JSON...');
      final jsonString = const JsonEncoder.withIndent('  ').convert(exportData);

      // Get temporary directory
      print('📁 DataExport: Getting temporary directory...');
      final directory = await getTemporaryDirectory();
      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final fileName = 'aqualert_backup_$timestamp.json';
      final filePath = '${directory.path}/$fileName';
      print('📁 DataExport: File path: $filePath');

      // Write to file
      print('💾 DataExport: Writing to file...');
      final file = File(filePath);
      await file.writeAsString(jsonString);
      print('✅ DataExport: File written successfully');

      return filePath;
    } catch (e) {
      print('❌ DataExport: Failed to create export file: $e');
      throw Exception('Failed to create export file: ${e.toString()}');
    }
  }

  /// Share exported data
  Future<void> shareExportedData() async {
    try {
      print('🚀 DataExport: Starting share process...');
      final filePath = await exportToFile();
      final file = File(filePath);

      print('🔍 DataExport: Checking if file exists...');
      if (!await file.exists()) {
        print('❌ DataExport: Export file not found at: $filePath');
        throw Exception('Export file not found');
      }
      print('✅ DataExport: File exists, preparing to share...');

      print('📤 DataExport: Sharing file...');
      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'Aqualert Data Backup',
        text: 'My Aqualert water tracking data backup',
      );
      print('✅ DataExport: Share completed successfully');
    } catch (e) {
      print('❌ DataExport: Failed to share export: $e');
      throw Exception('Failed to share export: ${e.toString()}');
    }
  }

  /// Import data from JSON
  Future<Map<String, int>> importUserData(Map<String, dynamic> importData) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    // Validate import data
    if (importData['version'] == null) {
      throw Exception('Invalid import file format');
    }

    int importedRecords = 0;
    int importedGoals = 0;
    int skippedRecords = 0;

    // Import water records
    if (importData['waterRecords'] != null) {
      final waterRecords = importData['waterRecords'] as List;

      for (final record in waterRecords) {
        try {
          // Check if record already exists
          final existingRecord = await _firestore
              .collection('water_records')
              .where('userId', isEqualTo: userId)
              .where('timestamp',
                  isEqualTo: Timestamp.fromDate(DateTime.parse(record['timestamp'])))
              .where('amount', isEqualTo: record['amount'])
              .limit(1)
              .get();

          if (existingRecord.docs.isEmpty) {
            // Import new record
            await _firestore.collection('water_records').add({
              'userId': userId,
              'amount': record['amount'],
              'timestamp': Timestamp.fromDate(DateTime.parse(record['timestamp'])),
              'date': record['date'],
            });
            importedRecords++;
          } else {
            skippedRecords++;
          }
        } catch (e) {
          skippedRecords++;
          continue;
        }
      }
    }

    // Import daily goals
    if (importData['dailyGoals'] != null) {
      final dailyGoals = importData['dailyGoals'] as List;

      for (final goal in dailyGoals) {
        try {
          // Check if goal already exists for this date
          final existingGoal = await _firestore
              .collection('daily_goals')
              .where('userId', isEqualTo: userId)
              .where('date', isEqualTo: goal['date'])
              .limit(1)
              .get();

          if (existingGoal.docs.isEmpty) {
            // Import new goal
            await _firestore.collection('daily_goals').add({
              'userId': userId,
              'date': goal['date'],
              'targetAmount': goal['targetAmount'],
              'currentAmount': goal['currentAmount'],
            });
            importedGoals++;
          }
        } catch (e) {
          continue;
        }
      }
    }

    return {
      'importedRecords': importedRecords,
      'importedGoals': importedGoals,
      'skippedRecords': skippedRecords,
    };
  }

  /// Import data from JSON string
  Future<Map<String, int>> importFromJsonString(String jsonString) async {
    try {
      final importData = json.decode(jsonString) as Map<String, dynamic>;
      return await importUserData(importData);
    } catch (e) {
      throw Exception('Failed to parse import file: $e');
    }
  }

  /// Import data from file
  Future<Map<String, int>> importFromFile(String filePath) async {
    final file = File(filePath);

    if (!await file.exists()) {
      throw Exception('File not found');
    }

    final jsonString = await file.readAsString();
    return await importFromJsonString(jsonString);
  }

  /// Get export statistics
  Future<Map<String, int>> getExportStatistics() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      return {
        'waterRecords': 0,
        'dailyGoals': 0,
        'totalDays': 0,
      };
    }

    final waterRecordsCount = await _firestore
        .collection('water_records')
        .where('userId', isEqualTo: userId)
        .count()
        .get();

    final dailyGoalsCount = await _firestore
        .collection('daily_goals')
        .where('userId', isEqualTo: userId)
        .count()
        .get();

    return {
      'waterRecords': waterRecordsCount.count ?? 0,
      'dailyGoals': dailyGoalsCount.count ?? 0,
    };
  }
}
