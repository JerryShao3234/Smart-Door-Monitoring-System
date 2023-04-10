// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_failure.freezed.dart';

enum AuthenticationFailureCode {
  unauthorized(code: "unauthorized"),
  unknown(code: "unknown");

  final String code;

  const AuthenticationFailureCode({required this.code});

  /// The user-facing error message
  String get message {
    switch (this) {
      case AuthenticationFailureCode.unauthorized:
        return "Please check your login information and try again.";
      case AuthenticationFailureCode.unknown:
        return "An unknown error occurred. Please try again later.";
    }
  }
}

@freezed
class AuthenticationFailure with _$AuthenticationFailure implements Exception {
  const factory AuthenticationFailure(
    /// The associated error message.
    String message,
  ) = _AuthenticationFailure;

  factory AuthenticationFailure.fromEnum(AuthenticationFailureCode value) {
    return AuthenticationFailure(value.message);
  }

  factory AuthenticationFailure.fromCode(String code) {
    //turn code into enum (with an orElse fallback), and return fromEnum
    AuthenticationFailureCode value = AuthenticationFailureCode.values
        .firstWhere((element) => element.code == code,
            orElse: () => AuthenticationFailureCode.unknown);
    return AuthenticationFailure.fromEnum(value);
  }
}
