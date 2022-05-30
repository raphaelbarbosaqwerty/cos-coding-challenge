import 'dart:io';

abstract class IProfileRepository {
  Future<bool> changePassword(String password);
  Future<bool> updateProfilePhoto(File file);
}
