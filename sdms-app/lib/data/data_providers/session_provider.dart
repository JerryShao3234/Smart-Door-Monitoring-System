// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:sdms_app/business/exceptions/authentication_failure.dart';
import 'package:sdms_app/data/models/session.dart';
import 'package:sdms_app/data/models/user.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';
import 'package:sdms_app/globals.dart';

class SessionProvider extends SessionDataProvider {
  /// The StreamController for the [onSessionTypeChange] stream
  final StreamController<Session> _onSessionTypeChangeController =
      StreamController<Session>.broadcast();

  /// The active [Session]. Defaults to [EmptySession]
  Session _session = EmptySession();

  @override
  Future<Session> login(
      {required String email, required String password}) async {
    _session = AuthenticatingSession();
    _onSessionTypeChangeController.add(_session);

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      var url = Uri.http(Globals.cloudUrl, '/login');

      var response = await http.post(url, body: {
        "email": "test@test.com",
        "password": "asdfjkl;",
        // TODO: undo after

        // "email": email,
        // "password": password,
      }).timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          throw AuthenticationFailure.fromEnum(
              AuthenticationFailureCode.unknown);
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        _session = AuthenticatedSession(
          user: User(
            email: responseBody["email"],
            name: responseBody["name"],
            sdmsId: responseBody["de1socID"],
            token: responseBody["token"],
          ),
        );
      } else if (response.statusCode == 404) {
        _session = EmptySession(
          errorMessage: AuthenticationFailure.fromEnum(
                  AuthenticationFailureCode.unauthorized)
              .message,
        );
      }
    } catch (e) {
      print(e);
      _session = EmptySession(
        errorMessage: AuthenticationFailure.fromEnum(
                AuthenticationFailureCode.unauthorized)
            .message,
      );

      _onSessionTypeChangeController.add(_session);
      return _session;
    }

    _onSessionTypeChangeController.add(_session);
    return _session;
  }

  @override
  Future<Session> logout(String token, String email) async {
    await http.post(
      Uri.http(Globals.cloudUrl, '/logout'),
      body: {
        "email": email,
        "token": token,
      },
    );

    _session = EmptySession();
    _onSessionTypeChangeController.add(_session);
    return _session;
  }

  @override
  Stream<Session> get onSessionTypeChange =>
      _onSessionTypeChangeController.stream;

  @override
  Session get session => _session;
}
