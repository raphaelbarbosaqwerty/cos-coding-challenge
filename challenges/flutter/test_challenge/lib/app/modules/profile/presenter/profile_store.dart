import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:test_challenge/app/core/domain/usecases/do_logout.dart';
import 'package:test_challenge/app/modules/auth/domain/usecases/do_login.dart';
import 'package:test_challenge/app/modules/profile/presenter/states/profile_states.dart';

class ProfileStore extends ValueNotifier<ProfileState> {
  final IDoLogout doLogout;

  ProfileStore(this.doLogout) : super(InitialProfileState());

  Future<bool> logout() async {
    return await doLogout();
  }
}
