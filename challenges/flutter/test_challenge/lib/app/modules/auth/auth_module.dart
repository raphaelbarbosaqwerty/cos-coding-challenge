import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:test_challenge/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:test_challenge/app/modules/auth/domain/usecases/do_login.dart';
import 'package:test_challenge/app/modules/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:test_challenge/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:test_challenge/app/modules/auth/presenter/auth_page.dart';
import 'package:test_challenge/app/modules/auth/presenter/auth_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(i.get())),
    Bind.lazySingleton<IDoLogin>((i) => DoLogin(i.get())),
    Bind.lazySingleton<IAuthRepository>((i) => AuthRepository(i.get())),
    Bind.lazySingleton<IAuthDatasource>((i) => AuthDatasource(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
