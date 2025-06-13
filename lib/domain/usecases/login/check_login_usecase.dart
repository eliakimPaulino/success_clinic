import '../../repositories/auth_repository.dart';

class CheckLoginUseCase {
  final AuthRepository repository;

  CheckLoginUseCase(this.repository);

  Future<bool> call() {
    return repository.isLoggedIn();
  }
}
