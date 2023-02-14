import 'package:equatable/equatable.dart';

/// {@template authentication_exception}
/// Exceptions from the authentication client.
/// {@endtemplate}
abstract class AuthenticationException implements Exception {
  /// {@macro authentication_exception}
  const AuthenticationException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// {@endtemplate}
class LogInWithGoogleFailure extends AuthenticationException {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure(super.error);
}

/// {@template log_in_with_google_canceled}
/// Thrown during the sign in with google process if it's canceled.
/// {@endtemplate}
class LogInWithGoogleCanceled extends AuthenticationException {
  /// {@macro log_in_with_google_canceled}
  const LogInWithGoogleCanceled(super.error);
}

/// {@template authentication_user}
/// User model
///
/// [AuthenticationUser.anonymous] represents an unauthenticated user.
/// {@endtemplate}
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}
  const AuthenticationUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.isNewUser = true,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Whether the current user is a first time user.
  final bool isNewUser;

  /// Whether the current user is anonymous.
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = AuthenticationUser(id: '');

  @override
  List<Object?> get props => [email, id, name, photo, isNewUser];
}
