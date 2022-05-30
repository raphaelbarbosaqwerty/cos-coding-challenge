import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_challenge/app/core/data/datasources/core_datasource.dart';
import 'package:test_challenge/app/core/domain/repositories/core_repository_interface.dart';
import 'package:test_challenge/app/core/domain/usecases/do_logout.dart';
import 'package:test_challenge/app/core/infra/datasources/core_datasource_interface.dart';
import 'package:test_challenge/app/core/infra/repositories/core_repository.dart';
import 'package:test_challenge/app/modules/auth/auth_module.dart';
import 'package:test_challenge/app/modules/dashboard/dashboard_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind((i) => SharedPreferences.getInstance()),
    Bind.lazySingleton((i) => FirebaseFirestore.instance),
    Bind.lazySingleton((i) => FirebaseAuth.instance),
    Bind.lazySingleton((i) => FirebaseStorage.instance),
    Bind.lazySingleton<IDoLogout>((i) => DoLogout(i.get())),
    Bind.lazySingleton<ICoreRepository>((i) => CoreRepository(i.get())),
    Bind.lazySingleton<ICoreDatasource>((i) => CoreDatasource(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute('/dashboard', module: DashboardModule()),
  ];
}
