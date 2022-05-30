import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test_challenge/app/core/domain/usecases/do_logout.dart';
import 'package:test_challenge/app/core/utils/global_informations.dart';
import 'package:test_challenge/app/modules/dashboard/domain/entities/user_informations.dart';
import 'package:test_challenge/app/modules/profile/domain/usecases/change_password.dart';
import 'package:test_challenge/app/modules/profile/domain/usecases/change_profile_image.dart';
import 'package:test_challenge/app/modules/profile/presenter/states/profile_states.dart';

class ProfileStore extends ValueNotifier<ProfileState> {
  final IGlobalInformations globalInformations;
  final IChangeProfileImage changeProfileImage;
  final IChangePassword changePassword;
  final IDoLogout doLogout;

  ProfileStore(
    this.doLogout,
    this.changePassword,
    this.globalInformations,
    this.changeProfileImage,
  ) : super(InitialProfileState());

  Future<bool> logout() async {
    return await doLogout();
  }

  Future<void> changeUserPassword(String password) async {
    value = LoadingProfileState();
    final response = await changePassword(password);
    if (response) {
      value = SuccessProfileState();
    } else {
      value = ErrorProfileState("");
    }
  }

  Future<void> updateProfilePhoto(File file) async {
    value = LoadingProfileState();
    final response = await changeProfileImage(file);
    if (response) {
      value = SuccessProfileState();
    } else {
      value = ErrorProfileState("");
    }
  }

  UserInformations? get user => globalInformations.user;
}
