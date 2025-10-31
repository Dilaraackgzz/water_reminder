import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/data_export_service.dart';
import '../../core/providers/app_providers.dart';

/// Provider for DataExportService
final dataExportServiceProvider = Provider<DataExportService>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(firebaseAuthProvider);
  return DataExportService(firestore: firestore, auth: auth);
});

/// Provider for export statistics
final exportStatisticsProvider = FutureProvider<Map<String, int>>((ref) async {
  final exportService = ref.watch(dataExportServiceProvider);
  return await exportService.getExportStatistics();
});
