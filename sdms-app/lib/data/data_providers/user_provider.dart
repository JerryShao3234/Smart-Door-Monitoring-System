// Package imports:
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:sdms_app/business/exceptions/create_user_failure.dart';
import 'package:sdms_app/business/exceptions/failure_code.enum.dart';
import 'package:sdms_app/data/repositories/user_repository.dart';
import 'package:sdms_app/globals.dart';

class UserProvider extends UserDataProvider {
  final uuid = const Uuid();

  @override
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String sdmsId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      var url = Uri.http(Globals.cloudUrl, 'signup');

      var response = await http.post(url, body: {
        "email": email,
        "password": password,
        "de1socID": sdmsId,
        "name": name,
      });

      print(response.body);
    } on CreateUserFailure catch (_) {
      rethrow;
    } catch (_) {
      throw CreateUserFailure.fromEnum(FailureCode.unknown);
    }
  }
}
