import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_summary.freezed.dart';
part 'daily_summary.g.dart';

@freezed
class DailySummary with _$DailySummary {
  const factory DailySummary({
    required DateTime date,
    required int totalMl,
    required int goalMl,
    required List<String> recordIds,
    @Default(0) int streakDays,
    @Default(false) bool goalAchieved,
  }) = _DailySummary;

  factory DailySummary.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryFromJson(json);
}

extension DailySummaryExtension on DailySummary {
  double get progressPercentage {
    if (goalMl == 0) return 0.0;
    return (totalMl / goalMl).clamp(0.0, 1.0);
  }

  int get remainingMl {
    final remaining = goalMl - totalMl;
    return remaining > 0 ? remaining : 0;
  }

  String get statusMessage {
    if (goalAchieved) {
      return 'Günlük hedefini tamamladın! 🎉';
    } else if (progressPercentage >= 0.8) {
      return 'Harika gidiyorsun! 💪';
    } else if (progressPercentage >= 0.5) {
      return 'Yarı yoldasın! 🚀';
    } else if (progressPercentage >= 0.2) {
      return 'İyi başlangıç! 👍';
    } else {
      return 'Hadi başlayalım! 💧';
    }
  }

  Map<String, dynamic> toFirestore() {
    return {
      'date': date.millisecondsSinceEpoch,
      'totalMl': totalMl,
      'goalMl': goalMl,
      'recordIds': recordIds,
      'streakDays': streakDays,
      'goalAchieved': goalAchieved,
    };
  }

  static DailySummary fromFirestore(Map<String, dynamic> data) {
    return DailySummary(
      date: DateTime.fromMillisecondsSinceEpoch(data['date'] ?? 0),
      totalMl: data['totalMl'] ?? 0,
      goalMl: data['goalMl'] ?? 2000,
      recordIds: List<String>.from(data['recordIds'] ?? []),
      streakDays: data['streakDays'] ?? 0,
      goalAchieved: data['goalAchieved'] ?? false,
    );
  }
}