import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  int _mid = 0;

  int get mid => _mid;

  void setUserId(int id) {
    _mid = id;
    notifyListeners();
  }
}