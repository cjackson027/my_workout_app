import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as fs;

import '../controllers/auth_controller.dart';

class FirebaseStorage {
  Future<Uint8List?> getProfilePicture() {
    return _getReference().getData();
  }

  void setProfilePicture(Uint8List data) {
    _getReference().putData(data);
  }

  fs.Reference _getReference() {
    final userId = AuthController().getUserId();
    if (userId == null) {
      throw StateError('not logged in');
    }

    return fs.FirebaseStorage.instance.ref('images/$userId.png');
  }
}