import 'package:flutter/material.dart';

class StaffProvider extends ChangeNotifier {
  String? _selectedStaff;

  String? get selectedStaff => _selectedStaff;

  void selectStaff(String staffName) {
    _selectedStaff = staffName;
    notifyListeners();
  }
}
