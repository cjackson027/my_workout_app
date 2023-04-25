import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../controllers/auth_controller.dart';
import '../services/firebase_storage.dart';

class ProfilePictureNotifier extends ChangeNotifier {
  ProfilePictureNotifier() {
    _reload(AuthController().isSignedIn());

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) => _reload(user == null));
  }

  Uint8List? _data;
  bool _isLoading = true;
  bool _exists = false;

  final _storage = FirebaseStorage();

  Uint8List? get data => _data;

  bool get isLoading => _isLoading;

  bool get exists => _exists;

  void updateProfilePicture(Uint8List data) {
    _data = data;
    _exists = true;
    _isLoading = false;
    notifyListeners();

    _storage.setProfilePicture(data);
  }

  Future<void> _reload(bool isLoggedIn) async {
    if (isLoggedIn) {
      _isLoading = true;
      notifyListeners();

      final profilePic = await _storage.getProfilePicture();
      _exists = profilePic != null;
      _data = profilePic;
      notifyListeners();
    } else {
      _data = null;
      _isLoading = false;
      _exists = false;
      notifyListeners();
    }
  }
}
