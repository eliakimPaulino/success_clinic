import '../../repositories/auth_repository.dart';

class GetCurrentUserNameUseCase {
  final AuthRepository repo;
  GetCurrentUserNameUseCase(this.repo);
  Future<String?> call() => repo.getCurrentUserName();
}
