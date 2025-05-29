import 'package:road_wise/features/auth/domain/entities/user.dart';
import 'package:road_wise/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User> call(SignInParams params) {
    return repository.signInWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
