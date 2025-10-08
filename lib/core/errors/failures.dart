import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    String? code,
  }) = ServerFailure;

  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  const factory Failure.auth({
    required String message,
    String? code,
  }) = AuthFailure;

  const factory Failure.local({
    required String message,
  }) = LocalFailure;

  const factory Failure.permission({
    required String message,
  }) = PermissionFailure;

  const factory Failure.validation({
    required String message,
    String? field,
  }) = ValidationFailure;

  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;
}

extension FailureExtension on Failure {
  String get displayMessage {
    return when(
      server: (message, code) => 'Sunucu hatası: $message',
      network: (message) => 'İnternet bağlantı hatası: $message',
      auth: (message, code) => 'Kimlik doğrulama hatası: $message',
      local: (message) => 'Yerel depolama hatası: $message',
      permission: (message) => 'İzin hatası: $message',
      validation: (message, field) => field != null
          ? '$field: $message'
          : 'Doğrulama hatası: $message',
      unknown: (message) => 'Bilinmeyen hata: $message',
    );
  }
}