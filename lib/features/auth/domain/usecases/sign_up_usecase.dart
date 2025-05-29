import 'package:road_wise/features/auth/domain/entities/user.dart';
import 'package:road_wise/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User> call(SignUpParams params) {
    return repository.signUpWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String? displayName;

  SignUpParams({
    required this.email,
    required this.password,
    this.displayName,
  });
}
