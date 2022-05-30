import 'package:test_challenge/app/core/domain/repositories/core_repository_interface.dart';

abstract class IDoLogout {
  Future<bool> call();
}

class DoLogout implements IDoLogout {
  final ICoreRepository repository;

  DoLogout(this.repository);

  @override
  Future<bool> call() async {
    try {
      return repository.doLogout();
    } catch (e) {
      return false;
    }
  }
}
