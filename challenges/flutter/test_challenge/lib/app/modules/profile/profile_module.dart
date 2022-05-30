import 'package:test_challenge/app/modules/profile/data/datasources/profile_datasource.dart';
import 'package:test_challenge/app/modules/profile/domain/repositories/profile_repository_interface.dart';
import 'package:test_challenge/app/modules/profile/domain/usecases/change_password.dart';
import 'package:test_challenge/app/modules/profile/infra/datasources/profile_datasource_interface.dart';
import 'package:test_challenge/app/modules/profile/infra/repositories/profile_repository.dart';
import 'package:test_challenge/app/modules/profile/presenter/profile_page.dart';
import 'package:test_challenge/app/modules/profile/presenter/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore(i.get(), i.get(), i.get())),
    Bind.lazySingleton<IChangePassword>((i) => ChangePassword(i.get())),
    Bind.lazySingleton<IProfileRepository>((i) => ProfileRepository(i.get())),
    Bind.lazySingleton<IProfileDatasource>((i) => ProfileDatasource(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProfilePage()),
  ];
}
