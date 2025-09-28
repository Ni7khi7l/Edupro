import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dristi_tech/features/core/enum.dart';
import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  final _firebaseStore = FirebaseFirestore.instance;
  StatusUtils _statusUtils = StatusUtils.idle;
  StatusUtils get statusUtils => _statusUtils;
  List<Map<String, dynamic>> _attendanceList = [];
  List<Map<String, dynamic>> get attendanceList => _attendanceList;

  String? errorMessage;

  Future<void> addattendance(
      String todaysDate,
      String contains,
      String title,
      ) async {
    _statusUtils = StatusUtils.loading;
    notifyListeners();

    try {
      final data = {
        "todaysdate": todaysDate,
        "contains": contains,
        "title": title,
       
      };

      await _firebaseStore.collection("addCategory").add(data);
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }

  Future<void> fetchcourses() async {
    _statusUtils = StatusUtils.loading;
    try {
      final snapshot = await _firebaseStore.collection("addAttendance").get();
      _attendanceList = snapshot.docs
          .map((title) => {'id': title.id, ...title.data()})
          .toList();
      _statusUtils = StatusUtils.sucess;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      _statusUtils = StatusUtils.error;
      notifyListeners();
    }
  }
}
