// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/business/exceptions/authentication_failure.dart';
import 'package:sdms_app/data/models/session.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

/// The Cubit to handle the login form
class LoginCubit extends Cubit<LoginState> {
  /// The [SessionRepository] singleton, which actually handles the login
  final SessionRepository _sessionRepository;

  LoginCubit({required SessionRepository sessionRepository})
      : _sessionRepository = sessionRepository,
        super(const LoginState());

  /// Moves the status from [LoginFormStatus.submissionSuccess] to
  /// [LoginFormStatus.initial].
  ///
  /// If the state's status is not currently [LoginFormStatus.submissionSuccess]
  /// this will do nothing.
  void resetStatus() {
    if (state.status != LoginFormStatus.submissionSuccess) {
      return;
    }
    emit(state.copyWith(status: LoginFormStatus.initial));
  }

  /// Updates the state with a new email
  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
    ));
  }

  /// Updates the state with a new password
  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
    ));
  }

  /// Attempts to login via the [SessionRepository] singleton, and eventually
  /// updates the state with success/failure.
  Future<void> login() async {
    _login();
  }

  /// The generic (private) login method.
  Future<void> _login() async {
    emit(state.copyWith(
      status: LoginFormStatus.submissionInProgress,
      errorMessage: null,
    ));
    try {
      late final Session session;

      session = await _sessionRepository.login(
        email: state.email,
        password: state.password,
      );

      // A valid session does not mean an authenticated session. Check:
      if (session is EmptySession) {
        if (!isClosed) {
          emit(state.copyWith(
            status: LoginFormStatus.submissionFailure,
            errorMessage: session.errorMessage ??
                AuthenticationFailure.fromEnum(
                        AuthenticationFailureCode.unauthorized)
                    .message,
          ));
        }
      } else if (session is AuthenticatedSession) {
        if (!isClosed) {
          emit(state.copyWith(
            status: LoginFormStatus.submissionSuccess,
            errorMessage: null,
          ));
        }
      }
    } catch (_) {
      // Rather than throwing errors, the Session can simply be unauthenticated,
      // resulting in a reason message being generated from the server. So there
      // aren't any specific errors to catch. This is a fallback:
      if (!isClosed) {
        emit(state.copyWith(
          status: LoginFormStatus.submissionFailure,
          errorMessage:
              AuthenticationFailure.fromEnum(AuthenticationFailureCode.unknown)
                  .message,
        ));
      }
    }
  }
}
