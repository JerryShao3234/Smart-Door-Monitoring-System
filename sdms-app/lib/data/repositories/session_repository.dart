// Dart imports:
import 'dart:async';

// Project imports:
import 'package:sdms_app/data/models/session.dart';
import 'package:sdms_app/data/models/user.dart';

/// The abstract provider for [Session] data.
///
/// Extend this class to provide the repository access to the the logged in
/// [User] and the accompanying [Session]
abstract class SessionDataProvider {
  /// Provide the [Session] so it can be accessed without async code.
  Session get session;

  /// Logs in via email and password.
  ///
  /// Restricted to sending back only a [Session] of types
  /// [EmptySession] or [AuthenticatedSession]
  Future<Session> login({
    required String email,
    required String password,
  });

  /// Returns an empty [Session] that's been logged out with a reason.
  ///
  /// [token] is the unique token id assigned to the user the last time
  /// they logged in.
  Future<Session> logout(String token, String email);

  /// The stream for when the session type changes.
  ///
  /// When implementing this, be sure to use [StreamController.broadcast()]
  Stream<Session> get onSessionTypeChange;
}

/// Repository to handle a specific [User] session, including login and logout.
///
/// This repository also has a getter for the logged in and authenticated [User]
/// - use this to access the [User] rather than using the [UserRepository].
///
/// To create / modify / maintain a user account, use [UserRepository].
class SessionRepository {
  final SessionDataProvider _sessionProvider;

  SessionRepository({required SessionDataProvider sessionProvider})
      : _sessionProvider = sessionProvider;

  /// Get the provider's [onSessionTypeChange] stream.
  ///
  /// This is a broadcast stream, so it takes multiple listeners if needed.
  Stream<Session> get onSessionTypeChange =>
      _sessionProvider.onSessionTypeChange;

  /// Get the provider's [User] on the current [Session]
  User get user {
    return _sessionProvider.session.user;
  }

  /// Get the provider's [Session]
  Session get session {
    return _sessionProvider.session;
  }

  /// Attempts a login via email / password and returns a [Session].
  ///
  /// The [Session] will be one of two types:
  /// * [EmptySession] for no email/password match
  /// * [AuthenticatedSession] for login success
  Future<Session> login({
    required String email,
    required String password,
  }) async {
    var session = await _sessionProvider.login(
      email: email,
      password: password,
    );
    return session;
  }

  /// Logs out the user and destroys local identifying data.
  Future<Session> logout() {
    return _sessionProvider.logout(
      user.token!,
      user.email,
    );
  }
}
