import 'package:road_wise/features/auth/domain/entities/user.dart';
import 'package:road_wise/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<User?> call() {
    return repository.getCurrentUser();
  }
}
