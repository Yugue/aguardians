import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentTrackModel extends ChangeNotifier {
  // If there is no signed in user, currentUser is null
  User? currentUser;

  void setUser(User? user) {
    currentUser = user;
    notifyListeners();
  }
}
