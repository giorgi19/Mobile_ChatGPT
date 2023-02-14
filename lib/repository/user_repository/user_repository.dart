import 'package:mobile_chatgpt/api/api.dart';
import 'package:mobile_chatgpt/api/clients/authentication_user/models/authentication_client.dart';

class UserRepository {
  UserRepository({required AuthenticationClient authenticationClient})
      : _authenticationClient = authenticationClient;

  final AuthenticationClient _authenticationClient;

  Future<void> logInWithGoogle() async {
    try {
      await _authenticationClient.logInWithGoogle();
    } on LogInWithGoogleFailure {
      rethrow;
    } on LogInWithGoogleCanceled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogInWithGoogleFailure(error), stackTrace);
    }
  }
}
