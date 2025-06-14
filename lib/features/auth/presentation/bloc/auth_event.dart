part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  // Add other fields as necessary, e.g., province

  const SignUpRequested(this.email, this.password, this.fullName);

  @override
  List<Object> get props => [email, password, fullName];
}

class SignOutRequested extends AuthEvent {
  const SignOutRequested();
}

// Add this event
class SocialLoginRequested extends AuthEvent {
  final String provider; // e.g., "google", "facebook"

  const SocialLoginRequested(this.provider);

  @override
  List<Object> get props => [provider];
}
