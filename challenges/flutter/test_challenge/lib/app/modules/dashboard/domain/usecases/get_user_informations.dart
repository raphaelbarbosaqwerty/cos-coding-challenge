import 'package:test_challenge/app/modules/dashboard/domain/entities/user_informations.dart';
import 'package:test_challenge/app/modules/dashboard/domain/repositories/dashboard_repository_interface.dart';

abstract class IGetUserInformations {
  Future<UserInformations> call();
}

class GetUserInformations implements IGetUserInformations {
  final IDashboardRepository repository;

  GetUserInformations(this.repository);

  @override
  Future<UserInformations> call() async {
    return repository.getUserInformations();
  }
}
