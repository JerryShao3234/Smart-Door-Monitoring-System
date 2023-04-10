// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/data/models/user.dart';

part 'session.freezed.dart';

/// A User Session, which may be logged out or logged in
///
/// Defaults to a logged out session. A logged in session has full access.
@freezed
class Session with _$Session {
  /// Private constructor to power freezed getters; unused
  const Session._();

  /// An empty session with no user or permissions.
  @Assert('user == User.empty', 'EmptySession User must be empty')
  const factory Session.empty({
    /// An empty User
    @Default(User.empty) User user,

    /// An error message on authorization fail, like no such email.
    String? errorMessage,
  }) = EmptySession;

  /// A session in the middle of authenticating, and waiting for a response
  @Assert('user == User.empty', 'authenticating User must be empty')
  const factory Session.authenticating({
    /// An empty User
    @Default(User.empty) User user,
  }) = AuthenticatingSession;

  /// An authenticated session with a populated user and full permissions
  @Assert('user != User.empty', 'authenticated User must not be empty')
  const factory Session.authenticated({
    /// User for this Session.
    required User user,
  }) = AuthenticatedSession;

  /// Returns true if the session is authenticated, and has access to the full
  /// app.
  bool get isAuthenticated {
    return this is AuthenticatedSession;
  }
}
