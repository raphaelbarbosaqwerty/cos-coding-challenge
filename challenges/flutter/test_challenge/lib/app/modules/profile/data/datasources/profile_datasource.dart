import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_challenge/app/modules/profile/infra/datasources/profile_datasource_interface.dart';

class ProfileDatasource implements IProfileDatasource {
  final FirebaseAuth auth;
  final FirebaseStorage storage;

  ProfileDatasource(
    this.auth,
    this.storage,
  );

  @override
  Future<bool> changePassword(String password) async {
    try {
      await auth.currentUser?.updatePassword(password);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateProfilePhoto(File file) async {
    try {
      final status = await storage
          .ref()
          .child("images/${auth.currentUser?.uid}")
          .putFile(file);
      await auth.currentUser?.updatePhotoURL(await status.ref.getDownloadURL());
      return true;
    } catch (e) {
      return false;
    }
  }
}
