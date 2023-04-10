part of 'create_account_cubit.dart';

enum CreateAccountFormStatus {
  initial,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
}

@freezed
class CreateAccountState with _$CreateAccountState {
  const CreateAccountState._();
  const factory CreateAccountState({
    /// The unique id of the SDMS that should be associated with this user
    @Default("") String sdmsId,

    /// The user's preferred name, probably just their first name
    @Default("") String name,

    /// The user's email address, validated by Flutter
    @Default("") String email,

    /// A minimum 8 character password
    @Default("") String password,

    /// The value of the Confirm Password text field, to ensure both are equal
    @Default("") String confirmPassword,

    /// The create account form status
    @Default(CreateAccountFormStatus.initial) CreateAccountFormStatus status,

    /// A form-wide error message, should the server have an issue
    String? errorMessage,
  }) = _CreateAccountState;

  bool get isDisabled =>
      status == CreateAccountFormStatus.submissionInProgress ||
      status == CreateAccountFormStatus.submissionSuccess;
}
