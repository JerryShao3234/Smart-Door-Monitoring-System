/// The abstract provider for [User] data.
///
/// Extend this class to provide the repository access to the root [User]
/// model. This works with the core User class, and is limited to creating and
/// deleting accounts only. Any other changes to the [User] should be done in
/// another DataProvider.
abstract class UserDataProvider {
  /// Creates a [User] and stores it in the database.
  ///
  /// Returns nothing; throws a [CreateUserFailure] if there are any problems.
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String sdmsId,
  });
}

/// Repository to handle [User] account creation and deletion.
///
/// This repository is responsible for creating users from scratch, and deleting
/// users from an authenticated session.
class UserRepository {
  final UserDataProvider _userProvider;

  UserRepository({required UserDataProvider userProvider})
      : _userProvider = userProvider;

  /// Creates a [User] from the SignUp Form and stores it in the database.
  ///
  /// As it's being created from the sign up form, all fields are required but
  /// the phone number, which is optional.
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String sdmsId,
  }) async {
    return _userProvider.createUser(
      name: name,
      email: email,
      password: password,
      sdmsId: sdmsId,
    );
  }
}
