// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  /// The minimum length for any user set / supplied password
  static const int minimumPasswordLength = 8;

  const User._();

  const factory User({
    /// User's name
    @JsonKey(name: 'name') required String name,

    /// User's email used during sign-up
    @JsonKey(name: 'email') required String email,

    /// A UUID representing the user's SDMS.
    @JsonKey(name: 'de1socID') required String sdmsId,

    /// A token for authorization requests
    @JsonKey(ignore: true) String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const User empty = User(
    name: '',
    sdmsId: '',
    email: '',
  );

  bool get isEmpty => this == User.empty;
}
