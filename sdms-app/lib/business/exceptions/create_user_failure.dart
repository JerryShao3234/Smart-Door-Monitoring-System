// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/business/exceptions/failure_code.enum.dart';

part 'create_user_failure.freezed.dart';

@freezed
class CreateUserFailure with _$CreateUserFailure implements Exception {
  const factory CreateUserFailure(
    String message,
  ) = _CreateUserFailure;

  factory CreateUserFailure.fromEnum(FailureCode value) {
    return CreateUserFailure(value.message);
  }

  factory CreateUserFailure.fromCode(String code) {
    //turn code into enum (with an orElse fallback), and return fromEnum
    FailureCode value = FailureCode.values.firstWhere(
        (element) => element.code == code,
        orElse: () => FailureCode.unknown);
    return CreateUserFailure.fromEnum(value);
  }
}
