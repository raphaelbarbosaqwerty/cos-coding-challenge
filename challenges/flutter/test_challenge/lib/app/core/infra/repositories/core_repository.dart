import 'package:test_challenge/app/core/domain/repositories/core_repository_interface.dart';
import 'package:test_challenge/app/core/infra/datasources/core_datasource_interface.dart';

class CoreRepository implements ICoreRepository {
  final ICoreDatasource datasource;

  CoreRepository(this.datasource);

  @override
  Future<bool> doLogout() async {
    try {
      return datasource.doLogout();
    } catch (e) {
      return false;
    }
  }
}
