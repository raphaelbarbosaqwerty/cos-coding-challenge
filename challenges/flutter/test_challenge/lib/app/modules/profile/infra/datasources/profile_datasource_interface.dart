import 'dart:io';

abstract class IProfileDatasource {
  Future<bool> changePassword(String password);
  Future<bool> updateProfilePhoto(File file);
}
