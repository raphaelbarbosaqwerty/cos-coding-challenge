import 'dart:io';

import 'package:test_challenge/app/modules/profile/domain/repositories/profile_repository_interface.dart';

abstract class IChangeProfileImage {
  Future<bool> call(File file);
}

class ChangeProfileImage implements IChangeProfileImage {
  final IProfileRepository repository;

  ChangeProfileImage(this.repository);

  @override
  Future<bool> call(File file) async {
    try {
      return repository.updateProfilePhoto(file);
    } catch (e) {
      return false;
    }
  }
}
