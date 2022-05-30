import 'package:test_challenge/app/modules/profile/domain/repositories/profile_repository_interface.dart';
import 'package:test_challenge/app/modules/profile/infra/datasources/profile_datasource_interface.dart';

class ProfileRepository implements IProfileRepository {
  final IProfileDatasource datasource;

  ProfileRepository(this.datasource);

  @override
  Future<bool> changePassword(String password) async {
    try {
      return await datasource.changePassword(password);
    } catch (e) {
      return false;
    }
  }
}
