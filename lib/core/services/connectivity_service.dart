import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Service to monitor network connectivity
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// Check if device is connected to internet
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }

  /// Stream of connectivity changes
  Stream<bool> get connectivityStream {
    return _connectivity.onConnectivityChanged.map((results) {
      return results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.ethernet);
    });
  }

  /// Start monitoring connectivity
  void startMonitoring(Function(bool) onConnectivityChanged) {
    _subscription = connectivityStream.listen(onConnectivityChanged) as StreamSubscription<List<ConnectivityResult>>?;
  }

  /// Stop monitoring
  void stopMonitoring() {
    _subscription?.cancel();
    _subscription = null;
  }

  void dispose() {
    stopMonitoring();
  }
}
