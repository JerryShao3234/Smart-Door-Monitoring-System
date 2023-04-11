// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/business/exceptions/authentication_failure.dart';
import 'package:sdms_app/business/exceptions/create_user_failure.dart';
import 'package:sdms_app/data/models/session.dart';
import 'package:sdms_app/data/models/user.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';
import 'package:sdms_app/data/repositories/user_repository.dart';

part 'create_account_state.dart';
part 'create_account_cubit.freezed.dart';

/// The Cubit to handle the CreateAccount form.
class CreateAccountCubit extends Cubit<CreateAccountState> {
  /// The [SessionRepository] singleton which handles the login
  final SessionRepository _sessionRepository;

  /// The [UserRepository] singleton which handles user creation
  final UserRepository _userRepository;

  CreateAccountCubit({
    required sessionRepository,
    required userRepository,
  })  : _sessionRepository = sessionRepository,
        _userRepository = userRepository,
        super(const CreateAccountState());

  /// Updates the state with a new sdmsId
  void sdmsIdChanged(String value) {
    emit(state.copyWith(
      sdmsId: value,
      errorMessage: null,
    ));
  }

  /// Updates the state with a new name
  void nameChanged(String value) {
    emit(state.copyWith(
      name: value,
      errorMessage: null,
    ));
  }

  /// Updates the state with a new email
  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      errorMessage: null,
    ));
  }

  /// Updates the state with a new password
  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      errorMessage: null,
    ));
  }

  /// Updates the state with a new confirmed password
  void confirmPasswordChanged(String value) {
    emit(state.copyWith(
      confirmPassword: value,
      errorMessage: null,
    ));
  }

  /// Attempts to create a user account and update the state with the progress.
  Future<void> signup() async {
    emit(state.copyWith(
      status: CreateAccountFormStatus.submissionInProgress,
      errorMessage: null,
    ));

    // Check all fields and update errorMessage if any don't check out
    if (state.password.length < User.minimumPasswordLength) {
      emit(
        state.copyWith(
            status: CreateAccountFormStatus.submissionFailure,
            errorMessage:
                "Passwords must be at least ${User.minimumPasswordLength} characters long."),
      );
      return;
    } else if (state.password != state.confirmPassword) {
      emit(state.copyWith(
        status: CreateAccountFormStatus.submissionFailure,
        errorMessage: "Passwords do not match.",
      ));
      return;
    }

    // All state checks passed, continue:
    try {
      await _userRepository.createUser(
        name: state.name,
        email: state.email,
        password: state.password,
        sdmsId: state.sdmsId,
      );

      // Once user is created, don't update state. Instead, go straight to login
      var session = await _sessionRepository.login(
        email: state.email,
        password: state.password,
      );

      // A valid session does not mean an authenticated session. Check:
      if (session is EmptySession) {
        if (!isClosed) {
          emit(state.copyWith(
            status: CreateAccountFormStatus.submissionFailure,
            errorMessage: session.errorMessage ??
                AuthenticationFailure.fromEnum(
                        AuthenticationFailureCode.unknown)
                    .message,
          ));
        }
      } else if (session is AuthenticatedSession) {
        // Either is a success; Flutter will handle nav away from this page.
        if (!isClosed) {
          emit(state.copyWith(
            status: CreateAccountFormStatus.submissionSuccess,
            errorMessage: null,
          ));
        }
      }
    } on CreateUserFailure catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
          status: CreateAccountFormStatus.submissionFailure,
          errorMessage: e.message,
        ));
      }
    } catch (_) {
      if (!isClosed) {
        emit(state.copyWith(
            status: CreateAccountFormStatus.submissionFailure,
            errorMessage: AuthenticationFailure.fromEnum(
                    AuthenticationFailureCode.unknown)
                .message));
      }
    }
  }

  /// Moves the status from [CreateAccountFormStatus.submissionSuccess] to
  /// [CreateAccountFormStatus.initial].
  ///
  /// If the state's status is not currently
  /// [CreateAccountFormStatus.submissionSuccess], this will do nothing.
  void resetStatus() {
    if (state.status != CreateAccountFormStatus.submissionSuccess) {
      return;
    }
    emit(state.copyWith(status: CreateAccountFormStatus.initial));
  }
}
