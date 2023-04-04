part of 'login_cubit.dart';

enum LoginFormStatus {
  initial,
  submissionInProgress,
  submissionSuccess,
  submissionFailure
}

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    /// The user-entered text in the email field
    @Default("") String email,

    /// The user-entered text in the password field
    @Default("") String password,

    /// The status of the form; mainly if it's "loading" or not
    @Default(LoginFormStatus.initial) LoginFormStatus status,

    /// An error message, typically as a result of a failed login
    String? errorMessage,
  }) = _LoginState;

  bool get isDisabled =>
      status == LoginFormStatus.submissionInProgress ||
      status == LoginFormStatus.submissionSuccess;
}
