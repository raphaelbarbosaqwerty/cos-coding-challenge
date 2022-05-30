import 'package:flutter/cupertino.dart';
import 'package:test_challenge/app/modules/dashboard/domain/entities/user_informations.dart';
import 'package:test_challenge/app/modules/dashboard/domain/usecases/get_user_informations.dart';

abstract class IGlobalInformations {
  UserInformations? user;
  Future<void> updateUser();
}

class GlobalInformations implements IGlobalInformations {
  final IGetUserInformations getUserInformations;

  @override
  UserInformations? user;

  GlobalInformations(this.getUserInformations) {
    getUserInformations.call().then(
          (value) => user = value,
        );
  }

  @override
  Future<void> updateUser() async {
    user = await getUserInformations.call();
  }
}
